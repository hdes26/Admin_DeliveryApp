import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/admin_page.dart';
import 'package:flutter_application_1/pages/pedidosPendientes_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => AdminPage(),
        'pedidosPendientes': (BuildContext context) => PedidosPendientes(),
      },
    );
  }
}
