import 'dart:convert';

import 'package:flutter_application_1/models/historialPedidos.dart';
import 'package:http/http.dart' as http;

class CategoriaProvider {
  String _url = 'backend-delivery.azurewebsites.net';

  Future<List<Historialenviados>> getAll(String token) async {
    final url = Uri.https(_url, '/api/pedido/get/enviado');
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categories = new Categorias.fromJsonList(decodeData['pedido']);
    return categories.categorys;
  }

  Future<Historialenviados> getOne(String id, String token) async {
    final url = Uri.https(_url, '/api/pedido/get/enviado' + id);
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categoria = new Historialenviados.fromJsonMap(decodeData['pedido']);
    return categoria;
  }
}
