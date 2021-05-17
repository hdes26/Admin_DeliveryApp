import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  EditCategory({Key key}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final formKey = GlobalKey<FormState>();

  String nombre = '';
  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Editar Categoria", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            _formCategory(parametros),
          ],
        ),
      ),
    );
  }

  Widget _formCategory(Map parametros) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        _inputTextNombre(parametros['nombre']),
        SizedBox(
          height: 60.0,
        ),
        _buttonSend(parametros['id'], nombre, context)
      ],
    );
  }

  Widget _buttonSend(
    String id,
    String nombre,
    BuildContext context,
  ) {
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    // ignore: deprecated_member_use
    // ignore: deprecated_member_use
    return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          'Editar categoria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          final response =
              await CategoriaProvider().update(id, nombre, infoProvider.token);
          await _mostrarAlert(response);
          Navigator.pop(context);
          // Navigator.pushNamed(context, 'editarcategoria2',
          //     arguments: {"id": dataid, "nombre": textController.text})
        });
  }

  Widget _inputTextNombre(String text) {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: text),
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
