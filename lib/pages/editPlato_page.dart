import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPlato extends StatefulWidget {
  EditPlato({Key key}) : super(key: key);

  @override
  _EditPlatoState createState() => _EditPlatoState();
}

class _EditPlatoState extends State<EditPlato> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Editar Plato", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            _formEditPlato(parametros),
            _buttonSend(),
          ],
        ),
      ),
    );
  }

  Widget _formEditPlato(Map platoParam) {
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
              _inputTextCategoria(platoParam['nombre categoria']["nombre"]),
              SizedBox(
                height: 20,
              ),
              Text(
                'Nombre de Plato',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextNombre(platoParam['nombre']),
              SizedBox(
                height: 20,
              ),
              Text(
                'Precio',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextPrecio(platoParam['nombre'].toString()),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingredientes',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextIngredientes(platoParam['ingredientes']),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }

  Widget _buttonSend() {
    // ignore: deprecated_member_use
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          'Editar Plato',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {
              // Navigator.pushNamed(context, 'loginVerificacion')
            });
  }

  Widget _inputTextCategoria(String text) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: text),
    );
  }

  Widget _inputTextNombre(String text) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: text),
    );
  }

  Widget _inputTextPrecio(String text) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: text),
    );
  }

  Widget _inputTextIngredientes(String text) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: text),
    );
  }
}
