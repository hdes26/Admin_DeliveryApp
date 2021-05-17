import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class Eliminarcategoria extends StatefulWidget {
  Eliminarcategoria({Key key}) : super(key: key);

  @override
  _EliminarcategoriaState createState() => _EliminarcategoriaState();
}

class _EliminarcategoriaState extends State<Eliminarcategoria> {
  getUserData() async {
    Map parametrosCategoria = ModalRoute.of(context).settings.arguments;
    final infoProvider = Provider.of<InfoProvider>(context);
    var url = 'https://backend-delivery.azurewebsites.net/api/category/remove/';
    var parametros = parametrosCategoria;

    var headerToken = 'x-access-token';
    final response = await http.delete(
      Uri.parse(url + parametros["id"]),
      headers: {headerToken: infoProvider.token},
    );

    final jsonData = jsonDecode(response.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminacion de categoria'),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Eliminando categoria...'),
                ),
              );
            } else
              return Container(
                child: Center(
                  child: Text('Categoria eliminada satisfactoriamente'),
                ),
              );
          },
        ),
      ),
    );
  }
}
