import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/platoModel.dart';

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

  Future<String> create(String token, String nombre, File image, String precio,
      String ingredientes, String categoria) async {
    final url = Uri.https(_url, '/api/plato/create');
    FormData formData = new FormData.fromMap({
      'categoria': categoria,
      'nombre': nombre,
      'precio': precio,
      'ingredientes': ingredientes,
      'img': await MultipartFile.fromFile(image.path),
    });
    var response = await Dio().postUri(url,
        data: formData,
        options: Options(headers: {
          'contentType': 'multipart/form-data',
          'x-access-token': token, // set content-length
        }));

    return response.data['message'];
  }

  delete(String id, String token) async {
    String endpoint = '/api/plato/remove/' + id;

    final url = Uri.https(_url, endpoint);

    final response = await http.delete(url, headers: {'x-access-token': token});

    final decodeData = json.decode(response.body);

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

    final decodeData = json.decode(response.body);
    // final plato = new Plato.fromJsonMap(decodeData['plato']);

    return decodeData['messagee'];
  }
}
