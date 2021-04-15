import 'dart:convert';

import 'package:flutter_application_1/models/platoModel.dart';
import 'package:flutter_application_1/providers/platosProdiver.dart';
import 'package:http/http.dart' as http;

class PlatosProvider {
  String _url = 'backend-delivery.azurewebsites.net';

  Future<List<Plato>> getAll(String token) async {
    final url = Uri.https(_url, '/api/plato');
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final platos = new Platos.fromJsonList(decodeData['platos']);

    return platos.platos;
  }

  Future<Plato> getOne(String id, String token) async {
    final url = Uri.https(_url, '/api/plato/' + id);
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final plato = new Plato.fromJsonMap(decodeData['plato']);

    return plato;
  }
}
