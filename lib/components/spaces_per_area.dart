import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class SpacesPerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      //using stream builder here so any additions or deletions in spaces can be updated dynamically
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('parking_spaces').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          Map<String, int> areaSpacesMap = {};
          snapshot.data!.docs.forEach((doc) {
            String area = doc['area'];
            if (areaSpacesMap.containsKey(area)) {
              areaSpacesMap[area] = areaSpacesMap[area]! + 1;
            } else {
              areaSpacesMap[area] = 1;
            }
          });
          List<MapEntry<String, int>> areaSpacesList = areaSpacesMap.entries.toList();
          areaSpacesList.sort((a, b) => b.value.compareTo(a.value));
          return Stack(
            children: [
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 10.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: areaSpacesList.map((entry) {
                      String area = entry.key;
                      int count = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            border: Border.all(
                              width: 1.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.of(context).primary.withOpacity(0.6),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  area,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Text(
                                    count.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
