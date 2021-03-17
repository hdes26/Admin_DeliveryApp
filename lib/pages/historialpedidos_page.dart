import 'package:flutter/material.dart';

class HistorialPedidos extends StatefulWidget {
  HistorialPedidos({Key key}) : super(key: key);

  @override
  _HistorialPedidosState createState() => _HistorialPedidosState();
}

class _HistorialPedidosState extends State<HistorialPedidos> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text("Historial pedidso"),
      ),
    );
  }
}