import 'dart:convert';

import 'package:flutter_application_1/models/pedidosPendientes.dart';

import 'package:http/http.dart' as http;

class PedidosProvider {
  String _url = 'backend-delivery.azurewebsites.net';

  Future<List<Historialpedidos>> getAll(String token) async {
    final url = Uri.https(_url, '/api/pedido/get/pendientes');
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final pedidos = new Pedido.fromJsonList(decodeData['pedido']);
    return pedidos.pedido;
  }

  Future<Historialpedidos> getOne(String id, String token) async {
    final url = Uri.https(_url, '/api/pedido/get/pendientes' + id);
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categoria = new Historialpedidos.fromJsonMap(decodeData['pedido']);
    return categoria;
  }
}
