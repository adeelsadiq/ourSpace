import '/auth/auth_util.dart';
import 'dart:io';
import '/backend/backend.dart';
import '/backend/stripeLogicHandling.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'add_space_model.dart';
export 'add_space_model.dart';
import 'package:go_router/go_router.dart';
import 'package:our_space_app/backend/stripeLogicHandling.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AddSpaceWidget extends StatefulWidget {
  const AddSpaceWidget({Key? key}) : super(key: key);

  @override
  _AddSpaceWidgetState createState() => _AddSpaceWidgetState();
}

class MyInAppWebView extends StatefulWidget {
  final Uri url;
  final BuildContext parentContext;
  final VoidCallback onWebViewFinished;

  const MyInAppWebView({
    Key? key,
    required this.url,
    required this.parentContext,
    required this.onWebViewFinished,
  }) : super(key: key);

  @override
  _MyInAppWebViewState createState() => _MyInAppWebViewState();
}

class _MyInAppWebViewState extends State<MyInAppWebView> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Onboarding'),
        backgroundColor: FlutterFlowTheme.of(context).primary,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: widget.url),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          if (url.toString().startsWith("ourspaceapp://")) {
            handleIncomingLink(url.toString(), context);
            widget.onWebViewFinished();
            Navigator.pop(widget.parentContext);
          }
        },
      ),
    );
  }
}

class _AddSpaceWidgetState extends State<AddSpaceWidget> {
  late AddSpaceModel _model;
  bool _showStripeOnboarding = true;
  Uri? _onboardingUri;
  Uri? link;
  bool _isLoading = false;
  void _onWebViewFinished() {
    setState(() {
      _showStripeOnboarding = false;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  void _launchURL() async {
    final Uri link = _onboardingUri!;
    if (_onboardingUri != null && await canLaunchUrl(link)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyInAppWebView(
            url: _onboardingUri!, // Add the null-check operator here
            parentContext: context,
            onWebViewFinished: _onWebViewFinished,
          ),
        ),
      );
    } else {
      throw 'Could not launch ${_onboardingUri.toString()}';
    }
  }

  @override
  void initState() {
    super.initState();
    initUniLinks(context);
    _model = createModel(context, () => AddSpaceModel());

    _model.titleController ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
    _model.addressController ??= TextEditingController();
    _model.dailyRateController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xA0FFFFFF),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: // Generated code for this IconButton Widget...
            FlutterFlowIconButton(
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
            context.pushNamed('homePage');
          },
        ),
        title: Text(
          'Add  Parking Space',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.titleController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                hintText: 'Add a title for your space',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282727),
                                    fontSize: 16.0,
                                  ),
                              validator: _model.titleControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.descriptionController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                hintText: 'Add a description for your space',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282727),
                                    fontSize: 16.0,
                                  ),
                              validator: _model.descriptionControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.addressController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Address',
                                hintText: 'Add the address for your space',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282727),
                                    fontSize: 16.0,
                                  ),
                              validator: _model.addressControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.dailyRateController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'DailyRate',
                                hintText: 'Daily Rate for the space..',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF282727),
                                    fontSize: 16.0,
                                  ),
                              validator: _model.dailyRateControllerValidator.asValidator(context),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.55, -0.55),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.areaController ??= FormFieldController<String>(null),
                              options: [
                                'Dublin 1',
                                'Dublin 2',
                                'Dublin 3',
                                'Dublin 4',
                                'Dublin 5',
                                'Dublin 6',
                                'Dublin 6w',
                                'Dublin 7',
                                'Dublin 8',
                                'Dublin 9',
                                'Dublin 10',
                                'Dublin 11',
                                'Dublin 12',
                                'Dublin 13',
                                'Dublin 14',
                                'Swords',
                                'Lusk',
                                'Rush'
                              ],
                              onChanged: (val) => setState(() => _model.areaValue = val),
                              width: double.infinity,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                              hintText: 'Please select local area...',
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowPlacePicker(
                                  iOSGoogleMapsApiKey: 'AIzaSyCOF1LidYj07rxZrXVSt-yGTTWdmdDqdVU',
                                  androidGoogleMapsApiKey: 'AIzaSyAozl79XPyZ_cD-pRkMCP4ItGSW8t5AQOA',
                                  webGoogleMapsApiKey: 'AIzaSyDWwxq-6kAZQl7ABysDdHSGoSY9KSPtLL0',
                                  onSelect: (place) async {
                                    setState(() {
                                      _model.exactLocationValue = place;
                                    });
                                  },
                                  defaultText: 'Select Exact Location',
                                  icon: Icon(
                                    Icons.place,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                  buttonOptions: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 0.0, 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (((_model.titleController.text.isEmpty) ||
                                        (_model.descriptionController.text.isEmpty) ||
                                        (_model.addressController.text.isEmpty) ||
                                        (_model.dailyRateController.text.isEmpty))) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please fill all fields',
                                            style: TextStyle(
                                              color: FlutterFlowTheme.of(context).primaryText,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                        ),
                                      );
                                      return;
                                    } else {
                                      final parkingSpacesCreateData = {
                                        ...createParkingSpacesRecordData(
                                          name: _model.titleController.text,
                                          location: _model.exactLocationValue.latLng,
                                          description: _model.descriptionController.text,
                                          addressLine1: _model.addressController.text,
                                          area: _model.areaValue,
                                          ownerId: currentUserReference,
                                          dailyRate: double.tryParse(_model.dailyRateController.text),
                                          imgUrl: 'https://picsum.photos/200/300?random=1',
                                        ),
                                        'dateAdded': FieldValue.serverTimestamp(),
                                      };
                                      await ParkingSpacesRecord.collection.doc().set(parkingSpacesCreateData);
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Space Added'),
                                            content: Text('The space was added succesfully, click ok to finish!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    context.pushNamed(
                                      'profilePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType: PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 5),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Add Space',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (currentUserDocument?.stripeID == '' && _showStripeOnboarding)
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 800,
                        maxHeight: 800,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(244, 249, 189, 226),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 25),
                                        child: Text(
                                          'Please provide your Stripe account \ndetails before adding a space. It is \nessential to have a connected Stripe \naccount to ensure you receive payments. ',
                                          style: FlutterFlowTheme.of(context).titleSmall,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final Uri? onboardingUri = await createStripeAccount();
                                          if (onboardingUri != null) {
                                            setState(() {
                                              _onboardingUri = onboardingUri;
                                              _isLoading = false;
                                            });
                                            _launchURL();
                                          } else {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          }
                                        },
                                        child: Text('Set up Stripe'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: FlutterFlowTheme.of(context).primary, // Set the button color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0), // Set the rounded edges
                                          ),
                                          padding:
                                              EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Set the padding
                                          textStyle: TextStyle(fontSize: 16), // Set the text style
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
//link ourspaceapp://ourspaceapp.com
