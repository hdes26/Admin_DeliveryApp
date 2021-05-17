import 'package:flutter/material.dart';
import 'package:flutter_application_1/preferencias_usuario/preferencias.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _prefs = new PreferenciasUsuario();
  @override
  void initState() {
    EasyLoading.dismiss();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _sizedScreen = MediaQuery.of(context).size;
    final infoProvider = Provider.of<InfoProvider>(context);
    infoProvider.token = _prefs.token;
    return Scaffold(
      backgroundColor: Color(0xEEEEEEEEEE),
      body: ListView(
        children: [
          Column(
            children: [
              _logo(),
              Column(
                children: [
                  Container(
                      width: _sizedScreen.width * 0.7,
                      child: _pedidosPendientes()),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: _sizedScreen.width * 0.7,
                    child: _categorias(),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: _sizedScreen.width * 0.7,
                    child: _platos(),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: _sizedScreen.width * 0.7,
                    child: _historialPedidos(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _pedidosPendientes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(7.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Pedidos pendientes',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Chonburi'),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, 'pedidosPendientes')},
          ),
        ),
      ],
    );
  }

  _categorias() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(7.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Categorias                 ',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Chonburi'),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, 'categorias')},
          ),
        ),
      ],
    );
  }

  _platos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(7.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Platos                         ',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Chonburi'),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, 'platos')},
          ),
        ),
      ],
    );
  }

  _historialPedidos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(7.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Historial pedidos',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Chonburi'),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, 'historialPedidos')},
          ),
        ),
      ],
    );
  }

  _logo() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0))),
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/img/logo.jpg',
            height: 180,
          )),
          Center(
              child: Text('Delivery fast food',
                  style: TextStyle(fontFamily: 'Chonburi', fontSize: 20))),
          SizedBox(
            height: 7,
          ),
          Center(
              child: Text(
            'ADMIN',
            style: TextStyle(fontFamily: 'Chonburi', fontSize: 20),
          )),
        ],
      ),
    );
  }
}
