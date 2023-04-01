// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spaces_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ParkingSpacesRecord> _$parkingSpacesRecordSerializer =
    new _$ParkingSpacesRecordSerializer();

class _$ParkingSpacesRecordSerializer
    implements StructuredSerializer<ParkingSpacesRecord> {
  @override
  final Iterable<Type> types = const [
    ParkingSpacesRecord,
    _$ParkingSpacesRecord
  ];
  @override
  final String wireName = 'ParkingSpacesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ParkingSpacesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.dailyRate;
    if (value != null) {
      result
        ..add('daily_rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ownerId;
    if (value != null) {
      result
        ..add('owner_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressLine1;
    if (value != null) {
      result
        ..add('addressLine1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.area;
    if (value != null) {
      result
        ..add('area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ParkingSpacesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParkingSpacesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'daily_rate':
          result.dailyRate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'owner_id':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addressLine1':
          result.addressLine1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ParkingSpacesRecord extends ParkingSpacesRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final double? dailyRate;
  @override
  final DocumentReference<Object?>? ownerId;
  @override
  final String? description;
  @override
  final String? addressLine1;
  @override
  final String? area;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ParkingSpacesRecord(
          [void Function(ParkingSpacesRecordBuilder)? updates]) =>
      (new ParkingSpacesRecordBuilder()..update(updates))._build();

  _$ParkingSpacesRecord._(
      {this.name,
      this.location,
      this.dailyRate,
      this.ownerId,
      this.description,
      this.addressLine1,
      this.area,
      this.ffRef})
      : super._();

  @override
  ParkingSpacesRecord rebuild(
          void Function(ParkingSpacesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParkingSpacesRecordBuilder toBuilder() =>
      new ParkingSpacesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParkingSpacesRecord &&
        name == other.name &&
        location == other.location &&
        dailyRate == other.dailyRate &&
        ownerId == other.ownerId &&
        description == other.description &&
        addressLine1 == other.addressLine1 &&
        area == other.area &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), location.hashCode),
                            dailyRate.hashCode),
                        ownerId.hashCode),
                    description.hashCode),
                addressLine1.hashCode),
            area.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ParkingSpacesRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('dailyRate', dailyRate)
          ..add('ownerId', ownerId)
          ..add('description', description)
          ..add('addressLine1', addressLine1)
          ..add('area', area)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ParkingSpacesRecordBuilder
    implements Builder<ParkingSpacesRecord, ParkingSpacesRecordBuilder> {
  _$ParkingSpacesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  double? _dailyRate;
  double? get dailyRate => _$this._dailyRate;
  set dailyRate(double? dailyRate) => _$this._dailyRate = dailyRate;

  DocumentReference<Object?>? _ownerId;
  DocumentReference<Object?>? get ownerId => _$this._ownerId;
  set ownerId(DocumentReference<Object?>? ownerId) => _$this._ownerId = ownerId;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(String? addressLine1) => _$this._addressLine1 = addressLine1;

  String? _area;
  String? get area => _$this._area;
  set area(String? area) => _$this._area = area;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ParkingSpacesRecordBuilder() {
    ParkingSpacesRecord._initializeBuilder(this);
  }

  ParkingSpacesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _dailyRate = $v.dailyRate;
      _ownerId = $v.ownerId;
      _description = $v.description;
      _addressLine1 = $v.addressLine1;
      _area = $v.area;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParkingSpacesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParkingSpacesRecord;
  }

  @override
  void update(void Function(ParkingSpacesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ParkingSpacesRecord build() => _build();

  _$ParkingSpacesRecord _build() {
    final _$result = _$v ??
        new _$ParkingSpacesRecord._(
            name: name,
            location: location,
            dailyRate: dailyRate,
            ownerId: ownerId,
            description: description,
            addressLine1: addressLine1,
            area: area,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
