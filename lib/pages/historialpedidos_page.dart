import 'package:flutter/material.dart';

class HistorialPedidos extends StatefulWidget {
  HistorialPedidos({Key key}) : super(key: key);

  @override
  _HistorialPedidosState createState() => _HistorialPedidosState();
}

class _HistorialPedidosState extends State<HistorialPedidos> {
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Historial de pedidos", style: TextStyle(color: Colors.grey)),
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
                _pedido("1", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("2", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("3", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("4", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("5", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("6", "Enviado"),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                _pedido("7", "Enviado"),
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
            hintText: "Buscar pedido",
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

  Widget _pedido(String numeroPedido, String estado) {
    Color colorBar;
    switch (estado) {
      case "Enviado":
        colorBar = Colors.blue;
        break;
      case "Enviado":
        colorBar = Colors.blue;
        break;
      case "Enviado":
        colorBar = Colors.blue;
        break;
      default:
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "pedido # " + numeroPedido,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox()),
            Text(
              "20.000",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listPedido(),
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
        )
      ],
    );
  }

  Widget _listPedido() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemList("1 perro sencillo"),
        SizedBox(height: 5.0),
        _itemList("2 perro gemelo"),
        SizedBox(height: 5.0),
        _itemList("1 pizza small"),
        SizedBox(height: 5.0),
        _itemList("1 perro sencillo"),
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
}