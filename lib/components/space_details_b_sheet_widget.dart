import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'space_details_b_sheet_model.dart';
export 'space_details_b_sheet_model.dart';
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class SpaceDetailsBSheetWidget extends StatefulWidget {
  const SpaceDetailsBSheetWidget({
    Key? key,
    this.spaceBsSheet,
    this.listDocs,
  }) : super(key: key);

  final ParkingSpacesRecord? spaceBsSheet;
  final Future<dynamic> Function()? listDocs;

  @override
  _SpaceDetailsBSheetWidgetState createState() =>
      _SpaceDetailsBSheetWidgetState();
}

final today = DateTime.now();
final fiftyDaysFromNow = today.add(const Duration(days: 50));

class _SpaceDetailsBSheetWidgetState extends State<SpaceDetailsBSheetWidget> {
  late SpaceDetailsBSheetModel _model;

  DateTime? endTime, startTime;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  Map<String, dynamic>? paymentIntent;

  void getBookedDate() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("bookings")
        .where("parking_space_ref", isEqualTo: widget.spaceBsSheet!.ffRef)
        .get();

    print(querySnapshot.docs.length);
    if (querySnapshot.size > 0) {
      _blockedRanges = querySnapshot.docs
          .map((e) => DateTimeRange(
              start: e.get("bookingStart").toDate(),
              end: e.get("bookingEnd").toDate()))
          .toList();

      setState(() {});
    }
  }

  Future<void> makePayment(
      String amount, DateTime dateStart, DateTime? dateEnd) async {
    try {
      int value = double.parse(amount).round().toInt();
      String totalPrice = (value * 100).toString();
      paymentIntent = await createPaymentIntent(totalPrice, 'EUR');
      print(paymentIntent);

      var gpay = PaymentSheetGooglePay(
          merchantCountryCode: "IE", currencyCode: "EUR", testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.dark,
                  merchantDisplayName: 'OurSpace Parking inc',
                  googlePay: gpay))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(amount, dateStart, dateEnd);
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet(
      String totalPrice, DateTime dateStart, DateTime? dateEnd) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        addBookingToFirebase(totalPrice, dateStart, dateEnd);
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51Ms8klHP4fXKJAPbjz0Y6p6qTkko7mGxJjImrUpOe3pY6NTS5ABeR1KXXNT66MwEAYRcGLSms70D5jTcLsgjIcqz00EN6sauD5',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getBookedDate();
    _model = createModel(context, () => SpaceDetailsBSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  List<DateTimeRange> _blockedRanges = [];
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.spaceBsSheet != null,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x25090F13),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.spaceBsSheet!.name,
                        'no name',
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      widget.spaceBsSheet!.description!,
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Text(
                        'Local Area: ',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        widget.spaceBsSheet!.area!,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Price:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Price in €',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            Text(
                              widget.spaceBsSheet!.dailyRate.toString(),
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            List<DateTime?>? dateRange =
                                await showCalendarDatePicker2Dialog(
                              context: context,
                              config:
                                  CalendarDatePicker2WithActionButtonsConfig(
                                calendarType: CalendarDatePicker2Type.range,
                                selectableDayPredicate: _isValidDateRange,
                                firstDate: DateTime.now(),
                                lastDate: fiftyDaysFromNow,
                              ),

                              dialogSize: const Size(325, 400),
                              // value: _dates,
                              borderRadius: BorderRadius.circular(15),
                            );
                            if (dateRange != null) {
                              if (dateRange.isNotEmpty) {
                                if (dateRange.length > 1) {
                                  Duration difference =
                                      dateRange[1]!.difference(dateRange[0]!);
                                  double totalPrice =
                                      widget.spaceBsSheet!.dailyRate! *
                                          difference.inDays;

                                  makePayment(totalPrice.toString(),
                                      dateRange[0]!, dateRange[1]!);
                                } else {
                                  makePayment(
                                      widget.spaceBsSheet!.dailyRate!
                                          .toString(),
                                      dateRange[0]!,
                                      dateRange[0]!);
                                }
                              }
                            }
                          },
                          text: 'View Available Slots',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addBookingToFirebase(
      String totalPrice, DateTime startTime, DateTime? endTime) async {
    DocumentReference userReference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);

    await FirebaseFirestore.instance.collection("bookings").add({
      "bookingStart": startTime,
      "bookingEnd": endTime,
      "bookedAt": DateTime.now(),
      "bookingUser": userReference,
      "parking_space_ref": widget.spaceBsSheet!.ffRef,
      "totalPrice": totalPrice,
    });
    getBookedDate();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24.0,
              ),
              Text("Your Parking space has been Successfully Booked "),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text("Ok"),
                    onPressed: () {
                      context.pushNamed('HomePage');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        );
      },
    );
  }

  bool _isValidDateRange(DateTime day) {
    // Only allow selection of dates within a certain range
    // listOfBookingDate.map((e) => range.isBefore(e.start) || range.isAfter(e.end)).toList();
    // final minDate = DateTime(2023, 4, 16);
    // final maxDate = DateTime(2023, 4, 20);
    // return range.isBefore(minDate) || range.isAfter(maxDate);
    return !(_blockedRanges.any((range) =>
        day.isAfter(range.start.subtract(Duration(days: 1))) &&
        day.isBefore(range.end.add(Duration(days: 1)))));
  }
}
