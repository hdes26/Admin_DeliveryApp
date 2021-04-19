import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class RegistroCategorias extends StatefulWidget {
  RegistroCategorias({Key key}) : super(key: key);

  @override
  _RegistroCategoriasState createState() => _RegistroCategoriasState();
}

class _RegistroCategoriasState extends State<RegistroCategorias> {
  String nombre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:
            Text("Registrar categoria", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            _formEditPlato(),
            _buttonSend(),
          ],
        ),
      ),
    );
  }

  Widget _formEditPlato() {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre de Categoria',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextNombre(),
            ],
          )),
    );
  }

  Widget _buttonSend() {
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    // ignore: deprecated_member_use
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          'Registrar  categoria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          var response =
              await CategoriaProvider().create(infoProvider.token, nombre);
          print(response);
          await _mostrarAlert(response);
          Navigator.pop(context);
        });
  }

  Widget _inputTextNombre() {
    return TextField(
        keyboardType: TextInputType.text,
        onChanged: (save) => setState(() {
              nombre = save;
            }));
  }

  Future _mostrarAlert(String message) {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: TextStyle(fontSize: 20),
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
}
