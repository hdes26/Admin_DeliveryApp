import 'dart:convert';

import 'package:flutter_application_1/models/pedidosPendientes.dart';
import 'package:flutter_application_1/pages/pedidosPendientes_page.dart';
import 'package:http/http.dart' as http;

class PedidosProvider {
  String _url = 'backend-delivery.azurewebsites.net';

  Future<List<Historialpedidos>> getAll(String token) async {
    final url = Uri.https(_url, '/api/pedido/');
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final pedidos = new Pedido.fromJsonList(decodeData['pedidos']);
    return pedidos.pedido;
  }

  Future<Historialpedidos> getOne(String id, String token) async {
    final url = Uri.https(_url, '/api/pedido/' + id);
    final response = await http.get(url, headers: {'x-access-token': token});
    final decodeData = json.decode(response.body);
    final categoria = new Historialpedidos.fromJsonMap(decodeData['pedidos']);
    return categoria;
  }
}
