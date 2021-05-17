import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/providers/historialpedidosProvider.dart';

import 'package:flutter/services.dart';

class PedidosCronologicos extends StatefulWidget {
  PedidosCronologicos({Key key}) : super(key: key);

  @override
  _PedidosCronologicosState createState() => _PedidosCronologicosState();
}

class _PedidosCronologicosState extends State<PedidosCronologicos> {
  String estados = "preparando";
  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Pedidos #1",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
//Fila 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Chonburi",
                  ),
                ),
                SizedBox(),
                Text(
                  parametros['total'],
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
//Fila 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Hora",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                SizedBox(),
                Text(
                  "12:00:00",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
//Fila 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "Dir. entrega",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                Text(
                  parametros['direccion'],
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                SizedBox(),
              ],
            ),

//Linea
            Divider(
              thickness: 2,
              color: Colors.black,
              height: 50.0,
            ),

            Row(
              children: [
                Text(
                  parametros['plato'],
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),

            Divider(
              thickness: 2,
              color: Colors.black,
              height: 50.0,
            ),
            Row(
              children: [],
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              maxLength: 2000,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Perro sin cebolla, hamburguesa sin pan xd',
              ),
            ),
            Row(
              children: [
                Text(
                  'Estado: ',
                  style: TextStyle(fontSize: 17),
                ),
                DropdownButton(
                    value: estados,
                    items: [
                      DropdownMenuItem(
                        child: Text('preparando'),
                        value: "preparando",
                      ),
                      DropdownMenuItem(
                        child: Text("enviado"),
                        value: "enviado",
                      ),
                      DropdownMenuItem(
                          child: Text("por confirmar"), value: "por confirmar"),
                    ],
                    onChanged: (value) {
                      estados = value;
                      setState(() async {
                        final response = await CategoriaProvider().update(
                            parametros["id"], estados, parametros["token"]);
                        await _mostrarAlert(response);
                        Navigator.pop(context);
                      });
                    })
              ],
            ),

            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 5)),
                Text(
                  'Pedidor por :',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5)),
                Text(
                  parametros['nombre'] + " " + parametros['apellidos'],
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Numero :',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5)),
                Text(
                  parametros['telefono'].toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _mostrarAlert(String message) {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                child: Text('Ok', style: TextStyle(fontSize: 20)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
