import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/domiciliarioModel.dart';
import 'package:flutter_application_1/providers/domicliariosProvider.dart';

import 'package:flutter_application_1/providers/historialpedidosProvider.dart';

import 'package:flutter/services.dart';

class PedidosCronologicos extends StatefulWidget {
  PedidosCronologicos({Key key}) : super(key: key);

  @override
  _PedidosCronologicosState createState() => _PedidosCronologicosState();
}

class _PedidosCronologicosState extends State<PedidosCronologicos> {
  String estados='por confirmar';
  final domiciliarioProvider = new DomiciliarioProvider();
  bool isButtonActive = false;
  bool isDomiciliaryActive=false;

  Domiciliarios domiciliaryAssingned =
      new Domiciliarios(nombre: '', apellidos: '');

  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;
    if(parametros['estado']!='por confirmar'){
      estados=parametros['estado'];
    }
    
    if (estados == 'preparando') {
      isButtonActive = true;
    }
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Pedidos #" + parametros['pedidoNumero'],
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
                    onChanged: (value) async {
                      setState(() {
                        estados = value;
                      });

                      
                      
                      
                      if(estados=='por confirmar'){
                        final response = await CategoriaProvider().update(
                          parametros["id"], estados, parametros["token"]);
                          await _mostrarAlert(response);
                      }else if(estados=='preparando'){
                          isButtonActive = true;
                         final response = await CategoriaProvider().update(
                          parametros["id"], estados, parametros["token"]);
                          await _mostrarAlert(response);
                          
                      }else if(estados == 'enviado'&&isDomiciliaryActive){
                        final response = await CategoriaProvider().update(
                          parametros["id"], estados, parametros["token"]);
                          await _mostrarAlert(response);
                          Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
                          
                      }else if(estados == 'enviado'&&isDomiciliaryActive==false){
                        await _mostrarAlert('No se ha asignado domiciliario');
                      }

                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Asignar Domiciliario :',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      domiciliaryAssingned.nombre +
                          ' ' +
                          domiciliaryAssingned.apellidos,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onSurface: Colors.redAccent, primary: Colors.red),
                    child: Text(
                      'Asignar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: isButtonActive
                        ? () async {
                            setState(() {});
                            if (estados.trim() == 'preparando') {
                              final info = await domiciliarioProvider
                                  .domiciliaryAvailable(parametros['token']);

                              if (info[0].id.length != 0) {
                                
                                await showDomiliciary(info, parametros);
                                
                              } else {
                                isDomiciliaryActive=false;
                                _mostrarAlert(
                                    'no hay domiciliarios disponibles');
                              }
                            } else {
                              
                              return null;
                            }
                          }
                        : null)
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

  Future<void> showDomiliciary(
      List<Domiciliarios> domiciliarios, Map parametros) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 300,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                itemCount: domiciliarios.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(top: 17, bottom: 5),
                      child: Text(domiciliarios[index].nombre +
                          " " +
                          domiciliarios[index].apellidos),
                    ),
                    onTap: () async {
                      setState(() {
                        domiciliaryAssingned = domiciliarios[index];
                      });
                      final info2 =
                          await domiciliarioProvider.assingDomiciliary(
                              parametros['token'],
                              parametros['id'],
                              domiciliaryAssingned.id);
                      if (info2 == 'se asgino correctamente el domiciliario') {
                        await _mostrarAlert(info2);
                        isDomiciliaryActive=true;
                      } else {
                        //Navigator.of(context).pushReplacementNamed('pedidosPendientes');
                        await _mostrarAlert(info2);
                        isDomiciliaryActive=false;
                        
                      }
                    
                      Navigator.of(context).pop();
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  thickness: 1,
                  endIndent: 10,
                  height: 1,
                ),
              ));
        });
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
