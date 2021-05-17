import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_application_1/models/loginModals.dart';
import 'package:flutter_application_1/providers/loginProvider-verification.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/utils/util.dart' as utils;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final loginProvider = new LoginProvider();
  LoginModal loginModal = new LoginModal();

  @override
  void initState() {
    EasyLoading.dismiss();
    super.initState();
  }

  // InfoProvider infoProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _fondo(context),
              SizedBox(height: 20),
              _form(context),
              SizedBox(height: 80),
              _button()
            ],
          ),
        ),
      ),
    );
  }

  Widget _button() {
    // ignore: deprecated_member_use
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      color: Color(0xF2EB1515),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        'Enviar Codigo',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () => submit(),
    );
  }

  submit() async {
    final infoProvider = Provider.of<InfoProvider>(this.context, listen: false);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      EasyLoading.show(
          status: "Loading",
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false);
      bool info = await loginProvider.user(infoProvider.number);
      print("Codigo " + loginModal.code.toString());
      if (info) {
        Navigator.pushNamed(context, 'loginVerificacion');
      } else {
        EasyLoading.dismiss();
        _mostrarAlert(loginProvider.message);
      }
    }
  }

  void _mostrarAlert(String message) {
    showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Informacion incorrecta',
              style: TextStyle(fontSize: 25),
            ),
            content: Text(
              message,
              style: TextStyle(fontSize: 18),
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

  Widget _fondo(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _logo(),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  'Iniciar Sesion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Color(0xF2EB1515),
                  height: 9,
                  width: 137,
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Center(
        heightFactor: 1.8,
        child: Image(
          image: AssetImage('assets/img/logo.jpg'),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Telefono',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _input(),
            ],
          )),
    );
  }

  Widget _input() {
    final infoProvider = Provider.of<InfoProvider>(this.context);
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(),
      onSaved: (value) => infoProvider.number = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value) && value.length == 10) {
          return null;
        } else {
          return 'Ingrese su numero de telefono';
        }
      },
    );
  }
}
