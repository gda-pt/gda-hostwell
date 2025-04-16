import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _requestTicketsAvailable = true;
  bool get requestTicketsAvailable => _requestTicketsAvailable;
  set requestTicketsAvailable(bool value) {
    _requestTicketsAvailable = value;
  }

  bool _isCheckedIn = false;
  bool get isCheckedIn => _isCheckedIn;
  set isCheckedIn(bool value) {
    _isCheckedIn = value;
  }

  bool _connectivityStatusOK = false;
  bool get connectivityStatusOK => _connectivityStatusOK;
  set connectivityStatusOK(bool value) {
    _connectivityStatusOK = value;
  }
}
