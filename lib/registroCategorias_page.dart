import 'package:flutter/material.dart';
class RegistroCategorias extends StatefulWidget {
  RegistroCategorias({Key key}) : super(key: key);

  @override
  _RegistroCategoriasState createState() => _RegistroCategoriasState();
}

class _RegistroCategoriasState extends State<RegistroCategorias> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Registrar categoria", style: TextStyle(color: Colors.grey)),
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
              _inputText(TextInputType.name),
        
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
          'Registrar  categoria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {Navigator.pushNamed(context, 'loginVerificacion')});
  }

  Widget _inputText(TextInputType type) {
    return TextField(
      keyboardType: type,
      decoration: InputDecoration(),
    );
  }

  Future _mostrarAlert() {
    
  }
}




    



