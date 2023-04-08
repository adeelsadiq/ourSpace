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
export 'my_bookings_model.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key? key}) : super(key: key);

  @override
  _MyBookingsWidgetState createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  late MyBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyBookingsModel());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'My Bookings',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed('HomePage');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                  child: FutureBuilder<List<BookingsRecord>>(
                    future: queryBookingsRecordOnce(
                      queryBuilder: (bookingsRecord) => bookingsRecord.where(
                          'bookingUser',
                          isEqualTo: currentUserReference),
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
                      List<BookingsRecord> listViewBookingsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBookingsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBookingsRecord =
                              listViewBookingsRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: StreamBuilder<ParkingSpacesRecord>(
                              stream: ParkingSpacesRecord.getDocument(
                                  listViewBookingsRecord.parkingSpaceRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final containerParkingSpacesRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 100.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 2.0, 2.0, 2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(44.0),
                                              child: Image.network(
                                                'https://picsum.photos/seed/183/600',
                                                width: 44.0,
                                                height: 44.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    containerParkingSpacesRecord
                                                        .name!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ),
                                                Text(
                                                  containerParkingSpacesRecord
                                                      .addressLine1!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
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
