import 'dart:convert';

import 'package:flutter_application_1/models/categoriaModel.dart';
import 'package:http/http.dart' as http;

class CategoriaProvider {
  String _url = 'backend-delivery.azurewebsites.net';

  Future<List<Categoria>> getAll(String token) async {
    final url = Uri.https(_url, '/api/category/');
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categories = new Categorias.fromJsonList(decodeData['category']);
    return categories.categorys;
  }

  Future<Categoria> getOne(String id, String token) async {
    final url = Uri.https(_url, '/api/category/' + id);
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categoria = new Categoria.fromJsonMap(decodeData['category']);
    return categoria;
  }

  Future<String> create(String token, String nombre) async {
    final url = Uri.https(_url, '/api/category/create');

    var response = await http.post(url, headers: {
      'x-access-token': token, // set content-length
    }, body: {
      "nombre": nombre
    });
    final decodeData = json.decode(response.body);
    print(decodeData['message']);
    // final response = await http.post("POST", url, headers: {
    //   'x-access-token': token,
    // }, body: {});
    // print(response.body);
    // final decodeData = json.decode(response.body);
    // final plato = new Plato.fromJsonMap(decodeData['plato']);
    // print(plato);
    return decodeData['message'];
  }

  delete(String id, String token) async {
    String endpoint = '/api/category/remove/' + id;
    final url = Uri.https(_url, endpoint);

    final response = await http.delete(url, headers: {'x-access-token': token});

    final decodeData = json.decode(response.body);

    return decodeData['message'].toString();
  }

  update(String id, String nombre, String token) async {
    final url = Uri.https(_url, '/api/category/update/' + id);
    final response = await http.put(url, headers: {
      'x-access-token': token
    }, body: {
      "nombre": nombre,
    });
    print(response.body);
    final decodeData = json.decode(response.body);

    return decodeData["message"];
  }
}
