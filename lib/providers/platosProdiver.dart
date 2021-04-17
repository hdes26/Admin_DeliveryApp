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

  delete(String id, String token) async {
    String endpoint = '/api/plato/remove/' + id;
    print(endpoint);
    final url = Uri.https(_url, endpoint);
    print(url);
    final response = await http.delete(url, headers: {'x-access-token': token});
    print(response.body);
    final decodeData = json.decode(response.body);
    print(decodeData);
    return decodeData['message'].toString();
  }

  update(String id, Plato platoParam, String token) async {
    final categoriaid = platoParam.categoryId['id'];
    final url = Uri.https(_url, '/api/plato/update/' + id);
    final response = await http.put(url, headers: {
      'x-access-token': token
    }, body: {
      "nombre": platoParam.nombre,
      "precio": platoParam.precio.toString(),
      "category_id": categoriaid,
      "ingredientes": platoParam.ingredientes,
    });
    print(response.body);
    final decodeData = json.decode(response.body);
    final plato = new Plato.fromJsonMap(decodeData['plato']);

    return plato;
  }
}
