import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/categoriaModel.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  final formKey = GlobalKey<FormState>();
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Categorias", style: TextStyle(color: Colors.grey)),
        ),
        bottomNavigationBar: _button(context),
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: _builderCategorias(context),
        ));
  }

  Widget _category(Categoria data, BuildContext context) {
    final infoProvider = Provider.of<InfoProvider>(context);
    return InkWell(
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(data.id),
        background: Container(
          color: Color(0x9DEB1515),
        ),
        onDismissed: (direccion) {
          CategoriaProvider().delete(data.id, infoProvider.token);
        },
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(data.nombre,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
            Divider(
              color: Colors.black,
              height: 27,
              thickness: 0.2,
            ),
          ],
        ),
      ),
      onTap: () async {
        await Navigator.pushNamed(context, 'editCategory',
            arguments: {"id": data.id, "nombre": data.nombre});
        setState(() => {});
      },
    );
  }

  Widget _builderCategorias(BuildContext context) {
    final infoProvider = Provider.of<InfoProvider>(context);
    return FutureBuilder(
      future: CategoriaProvider().getAll(infoProvider.token),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          // return Text("hola");
          return ListView.builder(
            physics: ScrollPhysics(parent: ScrollPhysics()),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            itemBuilder: (BuildContext context, int index) {
              return _category(snapshot.data[index], context);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
        onPressed: () async {
          await Navigator.pushNamed(context, 'registroCategoria');
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Registrar Categoria',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
