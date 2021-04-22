import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/pedidosPendientes.dart';
import 'package:flutter_application_1/providers/pedidoPendientesProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



class PedidosPendientes extends StatefulWidget {
  PedidosPendientes({Key key}) : super(key: key);

  @override
  _PedidosPendientesState createState() => _PedidosPendientesState();
}

class _PedidosPendientesState extends State<PedidosPendientes> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Pedidos Pendientes", style: TextStyle(color: Colors.grey)),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Column(
              children: [
                _formSearch(),
                SizedBox(
                  height: 20.0,
                ),
                _builderCategorias(context),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _formSearch() {
    return Form(
      key: formKey,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "Busca un plato",
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0x7E838989),
            ),
            focusColor: Color(0xffffffff),
            fillColor: Color(0xF2F2F2F2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            filled: true),
        onFieldSubmitted: (value) =>
            {Navigator.pushNamed(context, 'searchPlato')},
      ),
    );
  }

  Widget _pedido(int numeroPedido, String estado, int valor, String plato, String id) {
    Color colorBar;
    switch (estado) {
      case "enviado":
        colorBar = Colors.blue;
        break;
      case "por confirmar":
        colorBar = Colors.red;
        break;
      case "preparando":
        colorBar = Colors.yellow;
        break;
      default:
    }
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "pedido # " +  numeroPedido.toString(),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Text(
                valor.toString(),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _listPedido(plato.toString()),
              Container(
                decoration: BoxDecoration(
                    color: colorBar, borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    SizedBox(
                      width: 10,
                      height: 120,
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "calle 38B # 1c-72",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Estado: " + estado,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox()
            ],
          ),
               Divider(
        color: Colors.black,
        height: 27,
        thickness: 1.1,
      ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, 'pedidoscronologicos' ,arguments: {
          "total":valor.toString(),
          "direccion":"calle 38B # 1c-72",
          "plato":plato.toString(),
          "estado":estado.toString(),
          "id":id.toString(),
          "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJudW1lcm8iOjMxMDc0NzAwMTksImNvZGlnbyI6NjcwODc3LCJpYXQiOjE2MTg4NTUyMDQsImV4cCI6MTYxODg4NDAwNH0.BVH_P45gTnH3iXjPRZP7_kjptJDFIPQ8W_fwtPkjILk",
        });
      },
    );
  }

   Widget _listPedido(String platos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemList(platos),
        SizedBox(height: 5.0),
      ],
    );
  }

  Widget _itemList(String name) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }


  Widget _builderCategorias(BuildContext context) {
  final infoProvider = Provider.of<InfoProvider>(context);
  return FutureBuilder(
    future: PedidosProvider().getAll(infoProvider.token),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.hasData) {
        // return Text("hola");
        return ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          itemBuilder: (BuildContext context, int index) {
            print(snapshot.data[index].platos[0]["nombre"]);
            return 
              
                _pedido(snapshot.data[index].numero, snapshot.data[index].estado,snapshot.data[index].valor,snapshot.data[index].platos[0]["nombre"],snapshot.data[index].id);
              
            
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}


  
}


