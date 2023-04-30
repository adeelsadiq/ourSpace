import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_bookings_model.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
export 'my_bookings_model.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key? key}) : super(key: key);

  @override
  _MyBookingsWidgetState createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  late MyBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _model = createModel(context, () => MyBookingsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).black600,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('profilePage');
            },
          ),
          title: Text(
            'My Bookings',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: FutureBuilder<List<BookingsRecord>>(
                    future: queryBookingsRecordOnce(
                      queryBuilder: (bookingsRecord) => bookingsRecord
                          .where('bookingUser', isEqualTo: currentUserReference)
                          .orderBy('bookedAt', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<BookingsRecord> listViewBookingsRecordList = snapshot.data!;

                      if (listViewBookingsRecordList.isEmpty) {
                        return Image.asset(
                          'assets/images/nothing_to_see_here.jpg',
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBookingsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBookingsRecord = listViewBookingsRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 1),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(101, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 125,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 216, 204, 204),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network(
                                              'https://picsum.photos/seed/183/600?random=4',
                                              width: 150,
                                              height: 160,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(4, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                      child: Text(
                                                        'Created on: ',
                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                              fontFamily: 'Poppins',
                                                              fontSize: 14,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'EEE, MMM d, yyyy', listViewBookingsRecord.bookedAt!),
                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                              fontFamily: 'Poppins',
                                                              fontSize: 14,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                    child: Text(
                                                      'Booking Start: ',
                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'EEE, MMM d, yyyy', listViewBookingsRecord.bookingStart!),
                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                    child: Text(
                                                      'Booking End: ',
                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'EEE, MMM d, yyyy', listViewBookingsRecord.bookingEnd!),
                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                    child: Text(
                                                      'Booked ',
                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    dateTimeFormat('relative', listViewBookingsRecord.bookedAt!),
                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
                                                    child: Text(
                                                      'Total: ',
                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      listViewBookingsRecord.totalPrice!,
                                                      formatType: FormatType.decimal,
                                                      decimalType: DecimalType.automatic,
                                                      currency: '€',
                                                    ),
                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  // Text(
                                                  //   'Delete: ',
                                                  //   style: FlutterFlowTheme.of(context).bodySmall.override(
                                                  //         fontFamily: 'Poppins',
                                                  //         fontSize: 13,
                                                  //       ),
                                                  // ),
                                                  FlutterFlowIconButton(
                                                    borderColor: Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Color.fromARGB(255, 209, 28, 15),
                                                    ),
                                                    onPressed: () async {
                                                      var confirmDialogResponse = await showDialog<bool>(
                                                            context: context,
                                                            builder: (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text('Caution!'),
                                                                content: Text(
                                                                    'Are you sure you want to delete the booking! This can not be undone!'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () async {
                                                                      await listViewBookingsRecord.ffRef!.delete();
                                                                      Navigator.pop(alertDialogContext, true);
                                                                      context.pushNamed('myBookings');
                                                                    },
                                                                    child: Text('Delete'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(alertDialogContext, false),
                                                                    child: Text('Cancel'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        // Add item count here,
                        //make the listView scroll.
                        physics: ClampingScrollPhysics(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
