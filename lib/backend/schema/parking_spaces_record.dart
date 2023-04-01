import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'parking_spaces_record.g.dart';

abstract class ParkingSpacesRecord
    implements Built<ParkingSpacesRecord, ParkingSpacesRecordBuilder> {
  static Serializer<ParkingSpacesRecord> get serializer =>
      _$parkingSpacesRecordSerializer;

  String? get name;

  LatLng? get location;

  @BuiltValueField(wireName: 'daily_rate')
  double? get dailyRate;

  @BuiltValueField(wireName: 'owner_id')
  DocumentReference? get ownerId;

  String? get description;

  String? get addressLine1;

  String? get area;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ParkingSpacesRecordBuilder builder) => builder
    ..name = ''
    ..dailyRate = 0.0
    ..description = ''
    ..addressLine1 = ''
    ..area = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parking_spaces');

  static Stream<ParkingSpacesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ParkingSpacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ParkingSpacesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ParkingSpacesRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..dailyRate = snapshot.data['daily_rate']?.toDouble()
          ..ownerId = safeGet(() => toRef(snapshot.data['owner_id']))
          ..description = snapshot.data['description']
          ..addressLine1 = snapshot.data['addressLine1']
          ..area = snapshot.data['area']
          ..ffRef = ParkingSpacesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ParkingSpacesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'parking_spaces',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ParkingSpacesRecord._();
  factory ParkingSpacesRecord(
          [void Function(ParkingSpacesRecordBuilder) updates]) =
      _$ParkingSpacesRecord;

  static ParkingSpacesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createParkingSpacesRecordData({
  String? name,
  LatLng? location,
  double? dailyRate,
  DocumentReference? ownerId,
  String? description,
  String? addressLine1,
  String? area,
}) {
  final firestoreData = serializers.toFirestore(
    ParkingSpacesRecord.serializer,
    ParkingSpacesRecord(
      (p) => p
        ..name = name
        ..location = location
        ..dailyRate = dailyRate
        ..ownerId = ownerId
        ..description = description
        ..addressLine1 = addressLine1
        ..area = area,
    ),
  );

  return firestoreData;
}
