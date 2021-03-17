import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/admin_page.dart';
import 'package:flutter_application_1/pages/categorias_page.dart';
import 'package:flutter_application_1/pages/editCategory_page.dart';
import 'package:flutter_application_1/pages/pedidosPendientes_page.dart';
import 'package:flutter_application_1/pages/platos_page.dart';
import 'pages/Pedidoscronologicos_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => AdminPage(),
        'pedidosPendientes': (BuildContext context) => PedidosPendientes(),
        'categorias': (BuildContext context) => Categorias(),
        'platos': (BuildContext context) => Platos(),
        'historialPedidos': (BuildContext context) => Categorias(),
        'pedidosctronologicos': (BuildContext context) => PedidosCronologicos(),
        'editCategory': (BuildContext context) => EditCategory()
      },
    );
  }
}
