import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/admin_page.dart';
import 'package:flutter_application_1/pages/categorias_page.dart';
import 'package:flutter_application_1/pages/domiciliary.dart';
import 'package:flutter_application_1/pages/editCategory_page.dart';
import 'package:flutter_application_1/pages/editCategory_page2.dart';
import 'package:flutter_application_1/pages/editPlato_page.dart';
import 'package:flutter_application_1/pages/eliminarCategoria.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/loginVerificacion.dart';
import 'package:flutter_application_1/pages/pedidosPendientes_page.dart';
import 'package:flutter_application_1/pages/platos_page.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/registroCategorias_page.dart';
import 'package:flutter_application_1/registroPlato_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'pages/Pedidoscronologicos_page.dart';
import 'pages/historialpedidos_page.dart';
import 'pages/registerDomiciliary.dart';
import 'preferencias_usuario/preferencias.dart';

class MyAPP extends StatefulWidget {
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  final _prefs = new PreferenciasUsuario();
  String navegacion;
  @override
  Widget build(BuildContext context) {
    if (_prefs.token != "") {
      navegacion = "home";
    } else {
      navegacion = "login";
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InfoProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'MPLUSRounded1c'),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        initialRoute: navegacion,
        routes: {
          'home': (BuildContext context) => AdminPage(),
          'pedidosPendientes': (BuildContext context) => PedidosPendientes(),
          'categorias': (BuildContext context) => Category(),
          'platos': (BuildContext context) => Platos(),
          'historialPedidos': (BuildContext context) => HistorialPedidos(),
          'pedidoscronologicos': (BuildContext context) =>
              PedidosCronologicos(),
          'editCategory': (BuildContext context) => EditCategory(),
          'editPlato': (BuildContext context) => EditPlato(),
          'login': (BuildContext context) => Login(),
          'loginVerificacion': (BuildContext context) => LoginVerificacion(),
          'registroPlato': (BuildContext context) => RegistroPlato(),
          'registroCategoria': (BuildContext context) => RegistroCategorias(),
          'eliminarcategoria': (BuildContext context) => Eliminarcategoria(),
          'editarcategoria2': (BuildContext context) => Editarcategoria2(),
          'domiciliary':(BuildContext context)=>Domiciliary(),
          'registerDomiciliary':(BuildContext context)=>RegisterDomicilairy(),
        },
      ),
    );
  }
}
