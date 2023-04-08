import '/backend/backend.dart';
import '/components/space_details_b_sheet_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.docRef,
  }) : super(key: key);

  final ParkingSpacesRecord? docRef;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.minDailyRateController ??= TextEditingController();
    _model.maxDailyRateController ??= TextEditingController();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0x5CC0C0C0),
      drawer: Drawer(
        elevation: 16.0,
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.55, -0.77),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.areaController ??=
                        FormFieldController<String>(null),
                    options: [
                      'Adamstown',
                      'Ard Na Greine',
                      'Artane',
                      'Ashington',
                      'Ashtown',
                      'Aylesbury',
                      'Ayrfield',
                      'Balbriggan',
                      'Baldonnell',
                      'Baldoyle',
                      'Balgriffin',
                      'Ballinascorney',
                      'Ballinteer',
                      'Ballsbridge',
                      'Ballyboden',
                      'Ballybough',
                      'Ballyboughal',
                      'Ballybrack',
                      'Ballycorus',
                      'Ballycullen',
                      'Ballyfermot',
                      'Ballymount',
                      'Ballymun',
                      'Balrothery',
                      'Balscaddan',
                      'Beaumont',
                      'Blackrock',
                      'Booterstown',
                      'Castleknock',
                      'Cabra',
                      'Christchurch',
                      'Clarehall',
                      'Clondalkin',
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
                      'Lusk'
                    ],
                    onChanged: (val) => setState(() => _model.areaValue = val),
                    width: 180.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                    hintText: 'Please select local area...',
                    fillColor: Colors.white,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, -0.87),
                child: Text(
                  'Filter options:',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(-0.5, -0.5),
                                child: TextFormField(
                                  controller: _model.minDailyRateController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Min Rate',
                                    hintText: 'min',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 10.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .minDailyRateControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -0.5),
                              child: TextFormField(
                                controller: _model.maxDailyRateController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Max Rate',
                                  hintText: 'Max',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 10.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .maxDailyRateControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.15, -0.15),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _model.firestoreRequestCompleter = null);
                    await _model.waitForFirestoreRequestCompleted();
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                  text: 'Show Results',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.85, -0.95),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          'OurSpace',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.filter,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.9, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(-0.9, -0.75),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<List<ParkingSpacesRecord>>(
                              future: (_model.firestoreRequestCompleter ??=
                                      Completer<List<ParkingSpacesRecord>>()
                                        ..complete(
                                          queryParkingSpacesRecordOnce(
                                            queryBuilder: (parkingSpacesRecord) =>
                                                parkingSpacesRecord
                                                    .where('area',
                                                        isEqualTo:
                                                            _model.areaValue !=
                                                                    ''
                                                                ? _model
                                                                    .areaValue
                                                                : null)
                                                    .where('daily_rate',
                                                        isLessThanOrEqualTo:
                                                            double.tryParse(_model
                                                                .maxDailyRateController
                                                                .text))
                                                    .where('daily_rate',
                                                        isGreaterThanOrEqualTo:
                                                            double.tryParse(_model
                                                                .minDailyRateController
                                                                .text)),
                                          ),
                                        ))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ParkingSpacesRecord>
                                    tabBarParkingSpacesRecordList =
                                    snapshot.data!;
                                return DefaultTabController(
                                  length: 2,
                                  initialIndex: 0,
                                  child: Column(
                                    children: [
                                      TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        tabs: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.map,
                                                ),
                                              ),
                                              Tab(
                                                text: 'Map View',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons
                                                      .format_list_numbered_rounded,
                                                ),
                                              ),
                                              Tab(
                                                text: 'List View',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowGoogleMap(
                                                  controller: _model
                                                      .googleMapsController,
                                                  onCameraIdle: (latLng) =>
                                                      setState(() => _model
                                                              .googleMapsCenter =
                                                          latLng),
                                                  initialLocation: _model
                                                          .googleMapsCenter ??=
                                                      LatLng(
                                                          53.34734, -6.25913),
                                                  markers:
                                                      tabBarParkingSpacesRecordList
                                                          .map(
                                                            (e) =>
                                                                FlutterFlowMarker(
                                                              e.location!
                                                                  .serialize(),
                                                              e.location!,
                                                              () async {
                                                                await showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            350.0,
                                                                        child:
                                                                            SpaceDetailsBSheetWidget(
                                                                          spaceBsSheet:
                                                                              e,
                                                                          listDocs:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                            ),
                                                          )
                                                          .withoutNulls
                                                          .toList(),
                                                  markerColor:
                                                      GoogleMarkerColor.violet,
                                                  mapType: MapType.normal,
                                                  style:
                                                      GoogleMapStyle.standard,
                                                  initialZoom: 14.0,
                                                  allowInteraction: true,
                                                  allowZoom: true,
                                                  showZoomControls: false,
                                                  showLocation: true,
                                                  showCompass: false,
                                                  showMapToolbar: false,
                                                  showTraffic: false,
                                                  centerMapOnMarkerTap: true,
                                                ),
                                              ),
                                            ),
                                            KeepAliveWidgetWrapper(
                                              builder: (context) => Stack(
                                                children: [
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final spaceDetails =
                                                                tabBarParkingSpacesRecordList
                                                                    .toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  spaceDetails
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  spaceDetailsIndex) {
                                                                final spaceDetailsItem =
                                                                    spaceDetails[
                                                                        spaceDetailsIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: 350.0,
                                                                                  child: SpaceDetailsBSheetWidget(
                                                                                    spaceBsSheet: spaceDetailsItem,
                                                                                    listDocs: () async {},
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 90.0,
                                                                              height: 90.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                'https://picsum.photos/seed/251/600',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    spaceDetailsItem.name!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                  Text(
                                                                                    spaceDetailsItem.addressLine1!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                  Text(
                                                                                    spaceDetailsItem.area!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Daily Rate',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          formatNumber(
                                                                                            spaceDetailsItem.dailyRate!,
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.automatic,
                                                                                            currency: '€',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
