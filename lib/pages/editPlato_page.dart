import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/categoriaModel.dart';
import 'package:flutter_application_1/models/platoModel.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/platosProdiver.dart';
import 'package:provider/provider.dart';

class EditPlato extends StatefulWidget {
  EditPlato({Key key}) : super(key: key);

  @override
  _EditPlatoState createState() => _EditPlatoState();
}

class _EditPlatoState extends State<EditPlato> {
  final formKey = GlobalKey<FormState>();
  String seleccion;
  String nombrePlato = '';
  int precio = 0;
  String ingredientes = '';
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
            _buttonSend(parametros['id'], parametros),
          ],
        ),
      ),
    );
  }

  Widget _formEditPlato(Map platoParam) {
    final infoProvider = Provider.of<InfoProvider>(this.context, listen: false);
    return Container(
      child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("categoria ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              _inputDropDownCategory(platoParam, infoProvider),
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
              _inputTextPrecio(platoParam['precio'].toString()),
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

  Widget _buttonSend(String id, Map params) {
    final infoProvider = Provider.of<InfoProvider>(this.context, listen: false);
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
        onPressed: () {
          if (ingredientes == '' && nombrePlato == '' && precio == 0) {
            PlatosProvider().update(
                id,
                new Plato(
                    id: id,
                    nombre: params['nombre'],
                    precio: params['precio'],
                    ingredientes: params['ingredientes'],
                    categoryId: {'id': seleccion, 'nombre': ''}),
                infoProvider.token);
            Navigator.pop(context);
          } else if (ingredientes == '' && nombrePlato == '') {
            PlatosProvider().update(
                id,
                new Plato(
                    id: id,
                    nombre: params['nombre'],
                    precio: precio,
                    ingredientes: params['ingredientes'],
                    categoryId: {'id': seleccion, 'nombre': ''}),
                infoProvider.token);
            Navigator.pop(context);
          } else if (precio == 0 && nombrePlato == '') {
            PlatosProvider().update(
                id,
                new Plato(
                    id: id,
                    nombre: params['nombre'],
                    precio: params['precio'],
                    ingredientes: ingredientes,
                    categoryId: {'id': seleccion, 'nombre': ''}),
                infoProvider.token);
            Navigator.pop(context);
          } else if (precio == 0 && ingredientes == '') {
            PlatosProvider().update(
                id,
                new Plato(
                    id: id,
                    nombre: nombrePlato,
                    precio: params['precio'],
                    ingredientes: params['ingredientes'],
                    categoryId: {'id': seleccion, 'nombre': ''}),
                infoProvider.token);
            Navigator.pop(context);
          }
        });
  }

  Widget _inputDropDownCategory(Map platoParam, InfoProvider infoProvider) {
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

  Widget _inputTextNombre(String text) {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: text),
        onChanged: (save) => setState(() {
              nombrePlato = save;
            }));
  }

  Widget _inputTextPrecio(String text) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: text),
        onChanged: (save) => setState(() {
              precio = int.parse(save);
            }));
  }

  Widget _inputTextIngredientes(String text) {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: text),
        onChanged: (save) => setState(() {
              ingredientes = save;
            }));
  }
}
