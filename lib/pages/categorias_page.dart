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
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Categorias", style: TextStyle(color: Colors.grey)),
        ),

        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: _builderCategorias(context),
    
        )
        );
          }
}

Widget _category(Categoria data, BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(data.nombre, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
         Row(children: [

         
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.yellow,
              child: Icon(Icons.edit, size: 40),
            ),
            onTap: () => {Navigator.pushNamed(context, 'editCategory',arguments: {
              "id":data.id,
              "nombre":data.nombre
            })},
          ),
          SizedBox(
            width: 30,
          ),
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: Icon(Icons.delete_forever, size: 40),
            ),
            onTap: () => Navigator.pushNamed(context, 'eliminarcategoria', arguments: {
                    "id": data.id,
                  })
                  
      )],
      )]
      ),
      
      
            Divider(
        color: Colors.black,
        height: 27,
        thickness: 1.1,
      ),],
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
            print(snapshot.data[index].id);
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