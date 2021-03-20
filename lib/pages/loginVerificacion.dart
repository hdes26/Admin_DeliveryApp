import 'package:flutter/material.dart';

class LoginVerificacion extends StatefulWidget {
  LoginVerificacion({Key key}) : super(key: key);

  @override
  _LoginVerificacionState createState() => _LoginVerificacionState();
}

class _LoginVerificacionState extends State<LoginVerificacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _fondo(),
            SizedBox(height: 10),
            _form(),
            SizedBox(height: 150),
            _button(context)
          ],
        ),
      ),
    );
  }
}

Widget _fondo() {
  return Container(
    height: 280,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      color: Colors.white,
    ),
    child: Column(children: [
      _logo(),
    ]),
  );
}

Widget _logo() {
  return Container(
    child: Center(
      heightFactor: 1.7,
      child: Image(
        image: AssetImage('assets/logo.jpg'),
      ),
    ),
  );
}

Widget _form() {
  return Container(
    child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enviamos un codigo a tu numero de celular',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Verificacion movil',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            _input(),
          ],
        )),
  );
}

Widget _input() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(),
  );
}

Widget _button(BuildContext context) {
  // ignore: deprecated_member_use
  return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      color: Color(0xF2EB1515),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        'Verificar Codigo',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () => {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('home', (route) => false)
          });
}
