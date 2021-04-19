import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/platosProdiver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'models/categoriaModel.dart';

class RegistroPlato extends StatefulWidget {
  RegistroPlato({Key key}) : super(key: key);

  @override
  _RegistroPlatoState createState() => _RegistroPlatoState();
}

class _RegistroPlatoState extends State<RegistroPlato> {
  PickedFile imageFile;
  File imageSelected;
  String nombrePlato;
  int precio;
  String ingredientes;
  String seleccion;
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
      imageSelected = File(imageFile.path);
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
    final infoProvider = Provider.of<InfoProvider>(this.context, listen: false);
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
              _inputDropDownCategory(infoProvider),
              SizedBox(
                height: 15,
              ),
              Text(
                'Nombre de Plato',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextNombre(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Precio',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextPrecio(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Ingredientes',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              _inputTextIngredientes(),
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
        onPressed: () async {
          final infoProvider =
              Provider.of<InfoProvider>(context, listen: false);
          final response = await PlatosProvider().create(
              infoProvider.token,
              nombrePlato,
              imageSelected,
              precio.toString(),
              ingredientes,
              seleccion);

          var response2 = await _mostrarAlert(response.toString());
          Navigator.pop(context);
        });
  }

  Widget _inputTextNombre() {
    return TextField(
        keyboardType: TextInputType.text,
        onChanged: (save) => setState(() {
              nombrePlato = save;
            }));
  }

  Widget _inputTextPrecio() {
    return TextField(
        keyboardType: TextInputType.number,
        onChanged: (save) => setState(() {
              precio = int.parse(save);
            }));
  }

  Widget _inputTextIngredientes() {
    return TextField(
        keyboardType: TextInputType.text,
        onChanged: (save) => setState(() {
              ingredientes = save;
            }));
  }

  Widget _inputDropDownCategory(InfoProvider infoProvider) {
    return FutureBuilder(
      future: CategoriaProvider().getAll(infoProvider.token),
      builder: (BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
        if (snapshot.hasData) {
          return new DropdownButton(
            items: snapshot.data.map((item) {
              return DropdownMenuItem(
                child: Text(item.nombre),
                value: item.id,
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                print(newVal);
                seleccion = newVal;
              });
            },
            value: seleccion,
          );
        } else {
          return DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text('salchipapa'),
              )
            ],
          );
        }
      },
    );
  }

  Future _mostrarAlert(String message) {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
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
