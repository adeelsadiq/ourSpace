import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DateTime> _nextThirty = [
    DateTime.fromMillisecondsSinceEpoch(1679236564798),
    DateTime.fromMillisecondsSinceEpoch(1679322960000),
    DateTime.fromMillisecondsSinceEpoch(1679409360000),
    DateTime.fromMillisecondsSinceEpoch(1679495760000),
    DateTime.fromMillisecondsSinceEpoch(1679668620000),
    DateTime.fromMillisecondsSinceEpoch(1679755020000),
    DateTime.fromMillisecondsSinceEpoch(1679837820000),
    DateTime.fromMillisecondsSinceEpoch(1679924220000),
    DateTime.fromMillisecondsSinceEpoch(1680010620000),
    DateTime.fromMillisecondsSinceEpoch(1680097020000),
    DateTime.fromMillisecondsSinceEpoch(1680183420000),
    DateTime.fromMillisecondsSinceEpoch(1680269880000)
  ];
  List<DateTime> get nextThirty => _nextThirty;
  set nextThirty(List<DateTime> _value) {
    _nextThirty = _value;
  }

  void addToNextThirty(DateTime _value) {
    _nextThirty.add(_value);
  }

  void removeFromNextThirty(DateTime _value) {
    _nextThirty.remove(_value);
  }

  void removeAtIndexFromNextThirty(int _index) {
    _nextThirty.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
