import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/admin_page.dart';
import 'package:flutter_application_1/pages/categorias_page.dart';
import 'package:flutter_application_1/pages/pedidosPendientes_page.dart';
import 'package:flutter_application_1/pages/platos_page.dart';
import 'pages/Pedidoscronologicos_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'pedidosctronologicos',
      routes: {
        'home': (BuildContext context) => AdminPage(),
        'pedidosPendientes': (BuildContext context) => PedidosPendientes(),
<<<<<<< HEAD
        'categorias':(BuildContext context) => Categorias(),
        'platos':(BuildContext context) => Platos(),
        'historialPedidos':(BuildContext context) => Categorias(),
        'pedidosctronologicos':(BuildContext context) => PedidosCronologicos(),
=======
        'categorias': (BuildContext context) => Categorias(),
        'platos': (BuildContext context) => Platos(),
        'historialPedidos': (BuildContext context) => Categorias(),
>>>>>>> c02e01bcefc945b7142660c6b601deebe3f2d301
      },
    );
  }
}
