import 'package:flutter/foundation.dart';

class InfoProvider with ChangeNotifier {
  String _token = 'hola';
  int _number;

  get number {
    return _number;
  }

  set number(int number) {
    this._number = number;
  }

  get token {
    return _token;
  }

  set token(String value) {
    this._token = value;
  }

  @override
  void notifyListeners();
}
