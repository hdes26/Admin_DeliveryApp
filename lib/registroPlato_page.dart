import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistroPlato extends StatefulWidget {
  RegistroPlato({Key key}) : super(key: key);

  @override
  _RegistroPlatoState createState() => _RegistroPlatoState();
}

class _RegistroPlatoState extends State<RegistroPlato> {
  PickedFile imageFile;
  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No se ha seleccionado una imagen");
    } else {
      return Image.file(
        File(imageFile.path),
        height: 200,
        width: 200,
      );
    }
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Seleccione"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text('Galeria'),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text('Camara'),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Registrar plato", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            _formEditPlato(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: _buttonSend()),
    );
  }

  Widget _formEditPlato() {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre de Categoria',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputText(TextInputType.name),
              SizedBox(
                height: 15,
              ),
              Text(
                'Nombre de Plato',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputText(TextInputType.name),
              SizedBox(
                height: 15,
              ),
              Text(
                'Precio',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputText(TextInputType.number),
              SizedBox(
                height: 15,
              ),
              Text(
                'Ingredientes',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputText(TextInputType.name),
              SizedBox(
                height: 15,
              ),
              Text(
                'tiempo de preparacion',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputText(TextInputType.name),
              SizedBox(
                height: 20,
              ),
              _decideImageView(),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.archive),
                  onPressed: () {
                    _showDialog(context);
                  })
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
          'Registrar plato',
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
}
