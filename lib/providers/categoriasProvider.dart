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
}
