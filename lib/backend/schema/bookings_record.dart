import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  @BuiltValueField(wireName: 'parking_space_ref')
  DocumentReference? get parkingSpaceRef;

  DocumentReference? get bookingUser;

  double? get totalPrice;

  DateTime? get bookingStart;

  DateTime? get bookingEnd;

  DateTime? get bookedAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BookingsRecordBuilder builder) =>
      builder..totalPrice = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? parkingSpaceRef,
  DocumentReference? bookingUser,
  double? totalPrice,
  DateTime? bookingStart,
  DateTime? bookingEnd,
  DateTime? bookedAt,
}) {
  final firestoreData = serializers.toFirestore(
    BookingsRecord.serializer,
    BookingsRecord(
      (b) => b
        ..parkingSpaceRef = parkingSpaceRef
        ..bookingUser = bookingUser
        ..totalPrice = totalPrice
        ..bookingStart = bookingStart
        ..bookingEnd = bookingEnd
        ..bookedAt = bookedAt,
    ),
  );

  return firestoreData;
}
