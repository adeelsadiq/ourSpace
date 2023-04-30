import '/backend/backend.dart';
import '../../auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_spaces_model.dart';
export 'my_spaces_model.dart';

class MySpacesWidget extends StatefulWidget {
  const MySpacesWidget({
    Key? key,
    this.spaceRef,
  }) : super(key: key);

  final DocumentReference? spaceRef;

  @override
  _MySpacesWidgetState createState() => _MySpacesWidgetState();
}

class _MySpacesWidgetState extends State<MySpacesWidget> {
  late MySpacesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MySpacesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).black600,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('profilePage');
            },
          ),
          title: Text(
            'My Parking Spaces',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
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
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: FutureBuilder<List<ParkingSpacesRecord>>(
                    future: queryParkingSpacesRecordOnce(
                      queryBuilder: (parkingSpacesRecord) =>
                          parkingSpacesRecord.where('owner_id', isEqualTo: currentUserReference).orderBy('dateAdded'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ParkingSpacesRecord> listViewParkingSpacesRecordList = snapshot.data!;
                      if (listViewParkingSpacesRecordList.isEmpty) {
                        return Image.asset(
                          'assets/images/nothing_to_see_here.jpg',
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewParkingSpacesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewParkingSpacesRecord = listViewParkingSpacesRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    offset: Offset(0.0, 1.0),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
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
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                                                            child: Text(
                                                              'Created: ',
                                                              style:
                                                                  FlutterFlowTheme.of(context).headlineSmall.override(
                                                                        fontFamily: 'Poppins',
                                                                        fontSize: 14,
                                                                      ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 1),
                                                            child: Text(
                                                              dateTimeFormat('EEE, MMM d, yy',
                                                                  listViewParkingSpacesRecord.dateAdded!),
                                                              style:
                                                                  FlutterFlowTheme.of(context).headlineSmall.override(
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
                                                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 1),
                                                          child: Text(
                                                            listViewParkingSpacesRecord.addressLine1!
                                                                .maybeHandleOverflow(
                                                              maxChars: 30,
                                                              replacement: '…',
                                                            ),
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
                                                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 1),
                                                          child: Text(
                                                            'Area: ',
                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                  fontFamily: 'Poppins',
                                                                  fontSize: 13,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                                                          child: Text(
                                                            listViewParkingSpacesRecord.area!.maybeHandleOverflow(
                                                              maxChars: 30,
                                                              replacement: '…',
                                                            ),
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
                                                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 1),
                                                          child: Text(
                                                            '(',
                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                  fontFamily: 'Poppins',
                                                                  fontSize: 13,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                              'relative', listViewParkingSpacesRecord.dateAdded),
                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                fontFamily: 'Poppins',
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                        Text(
                                                          ')',
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
                                                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                          child: Text(
                                                            'Daily Rate: ',
                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                  fontFamily: 'Poppins',
                                                                  fontSize: 13,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          formatNumber(
                                                            listViewParkingSpacesRecord!.dailyRate,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor: Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Color.fromARGB(255, 209, 28, 15),
                                                      size: 30,
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
                                                                      await listViewParkingSpacesRecord.reference
                                                                          .delete();
                                                                      Navigator.pop(alertDialogContext, true);
                                                                      context.pushNamed('mySpaces');
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
                                                  FlutterFlowIconButton(
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.penToSquare,
                                                      color: Color.fromARGB(255, 13, 146, 17),
                                                      size: 25,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'EditSpace',
                                                        queryParams: {
                                                          'spaceRef': serializeParam(
                                                            listViewParkingSpacesRecord.reference,
                                                            ParamType.DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
