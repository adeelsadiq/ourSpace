import 'dart:async';

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

  DateTime? get dateAdded;

  @BuiltValueField(wireName: 'img_url')
  String? get imgUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ParkingSpacesRecordBuilder builder) => builder
    ..name = ''
    ..dailyRate = 0.0
    ..description = ''
    ..addressLine1 = ''
    ..area = ''
    ..imgUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parking_spaces');

  static Stream<ParkingSpacesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ParkingSpacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

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
  DateTime? dateAdded,
  String? imgUrl,
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
        ..area = area
        ..dateAdded = dateAdded
        ..imgUrl = imgUrl,
    ),
  );

  return firestoreData;
}
