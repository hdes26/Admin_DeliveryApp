import 'dart:convert';

import 'package:flutter_application_1/models/loginModals.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  String _message;

  String get message {
    return _message;
  }

  final loginModal = new LoginModal();
  Future<List> user(int number) async {
    String url =
        "https://backend-delivery.azurewebsites.net/api/auth/admin/login";

    var response =
        await http.post(Uri.parse(url), body: {"numero": number.toString()});

    final respDecode = jsonDecode(response.body);
    loginModal.code = respDecode["codigo"];

    print("El Codigo es " + loginModal.code.toString());

    if (loginModal.code == null) {
      _message = respDecode["message"];

      return [false];
    } else {
      return [true, loginModal.code];
    }
  }
}

class LoginVerificationProvider {
  final loginModal = new LoginModal();
  final infoProvider = new InfoProvider();
  Future<List> verification(int code, int number) async {
    String url =
        "https://backend-delivery.azurewebsites.net/api/auth/admin/verify";

    final resp = await http.post(Uri.parse(url), body: {
      "numero": number.toString(),
      "codigo": code.toString(),
    });

    Map<String, dynamic> respDecode = jsonDecode(resp.body);

    if (respDecode["message"] == "verificacion completada") {
      return [true, respDecode["token"]];
    } else {
      return [false];
    }
  }
}
