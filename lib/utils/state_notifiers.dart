import 'package:flutter/cupertino.dart';

class CustomStateNotifier extends ChangeNotifier {
  Map<dynamic, dynamic> _value = {};
  Map<dynamic, dynamic> get value => _value;

  void notify(value) {
    _value = value;
    notifyListeners();
  }

  void clear() {
    _value.clear();
    notifyListeners();
  }

  static const String sample = "sample";
}
