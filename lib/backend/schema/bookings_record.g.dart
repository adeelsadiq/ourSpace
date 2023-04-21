// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingsRecord> _$bookingsRecordSerializer =
    new _$BookingsRecordSerializer();

class _$BookingsRecordSerializer
    implements StructuredSerializer<BookingsRecord> {
  @override
  final Iterable<Type> types = const [BookingsRecord, _$BookingsRecord];
  @override
  final String wireName = 'BookingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.parkingSpaceRef;
    if (value != null) {
      result
        ..add('parking_space_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.bookingUser;
    if (value != null) {
      result
        ..add('bookingUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.totalPrice;
    if (value != null) {
      result
        ..add('totalPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.bookingStart;
    if (value != null) {
      result
        ..add('bookingStart')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bookingEnd;
    if (value != null) {
      result
        ..add('bookingEnd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bookedAt;
    if (value != null) {
      result
        ..add('bookedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BookingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'parking_space_ref':
          result.parkingSpaceRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'bookingUser':
          result.bookingUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'totalPrice':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'bookingStart':
          result.bookingStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookingEnd':
          result.bookingEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookedAt':
          result.bookedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BookingsRecord extends BookingsRecord {
  @override
  final DocumentReference<Object?>? parkingSpaceRef;
  @override
  final DocumentReference<Object?>? bookingUser;
  @override
  final double? totalPrice;
  @override
  final DateTime? bookingStart;
  @override
  final DateTime? bookingEnd;
  @override
  final DateTime? bookedAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookingsRecord([void Function(BookingsRecordBuilder)? updates]) =>
      (new BookingsRecordBuilder()..update(updates))._build();

  _$BookingsRecord._(
      {this.parkingSpaceRef,
      this.bookingUser,
      this.totalPrice,
      this.bookingStart,
      this.bookingEnd,
      this.bookedAt,
      this.ffRef})
      : super._();

  @override
  BookingsRecord rebuild(void Function(BookingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingsRecordBuilder toBuilder() =>
      new BookingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingsRecord &&
        parkingSpaceRef == other.parkingSpaceRef &&
        bookingUser == other.bookingUser &&
        totalPrice == other.totalPrice &&
        bookingStart == other.bookingStart &&
        bookingEnd == other.bookingEnd &&
        bookedAt == other.bookedAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parkingSpaceRef.hashCode);
    _$hash = $jc(_$hash, bookingUser.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, bookingStart.hashCode);
    _$hash = $jc(_$hash, bookingEnd.hashCode);
    _$hash = $jc(_$hash, bookedAt.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingsRecord')
          ..add('parkingSpaceRef', parkingSpaceRef)
          ..add('bookingUser', bookingUser)
          ..add('totalPrice', totalPrice)
          ..add('bookingStart', bookingStart)
          ..add('bookingEnd', bookingEnd)
          ..add('bookedAt', bookedAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookingsRecordBuilder
    implements Builder<BookingsRecord, BookingsRecordBuilder> {
  _$BookingsRecord? _$v;

  DocumentReference<Object?>? _parkingSpaceRef;
  DocumentReference<Object?>? get parkingSpaceRef => _$this._parkingSpaceRef;
  set parkingSpaceRef(DocumentReference<Object?>? parkingSpaceRef) =>
      _$this._parkingSpaceRef = parkingSpaceRef;

  DocumentReference<Object?>? _bookingUser;
  DocumentReference<Object?>? get bookingUser => _$this._bookingUser;
  set bookingUser(DocumentReference<Object?>? bookingUser) =>
      _$this._bookingUser = bookingUser;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  DateTime? _bookingStart;
  DateTime? get bookingStart => _$this._bookingStart;
  set bookingStart(DateTime? bookingStart) =>
      _$this._bookingStart = bookingStart;

  DateTime? _bookingEnd;
  DateTime? get bookingEnd => _$this._bookingEnd;
  set bookingEnd(DateTime? bookingEnd) => _$this._bookingEnd = bookingEnd;

  DateTime? _bookedAt;
  DateTime? get bookedAt => _$this._bookedAt;
  set bookedAt(DateTime? bookedAt) => _$this._bookedAt = bookedAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookingsRecordBuilder() {
    BookingsRecord._initializeBuilder(this);
  }

  BookingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parkingSpaceRef = $v.parkingSpaceRef;
      _bookingUser = $v.bookingUser;
      _totalPrice = $v.totalPrice;
      _bookingStart = $v.bookingStart;
      _bookingEnd = $v.bookingEnd;
      _bookedAt = $v.bookedAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingsRecord;
  }

  @override
  void update(void Function(BookingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingsRecord build() => _build();

  _$BookingsRecord _build() {
    final _$result = _$v ??
        new _$BookingsRecord._(
            parkingSpaceRef: parkingSpaceRef,
            bookingUser: bookingUser,
            totalPrice: totalPrice,
            bookingStart: bookingStart,
            bookingEnd: bookingEnd,
            bookedAt: bookedAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
