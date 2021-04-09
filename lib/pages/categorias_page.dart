import 'package:flutter/material.dart';

class Categorias extends StatefulWidget {
  Categorias({Key key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
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
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              _category("Perro caliente", context),
              Divider(
                color: Colors.black,
                thickness: 1.1,
                height: 27,
              ),
              _category("Salchipapa", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _category("pizza", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _category("hamburguesas", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _category("bebidas", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
                                  InkWell(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.grey,
              child: Center(child: Text('REGISTRAR NUEVO CATEGORIA'),),
            ),
            onTap: () => {Navigator.pushNamed(context, 'registroCategoria')},
          )],
          ),
        ));
  }
}

Widget _category(String text, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Row(
        children: [
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.yellow,
              child: Icon(Icons.edit, size: 40),
            ),
            onTap: () => {Navigator.pushNamed(context, 'editCategory')},
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
            onTap: () => {print("object1")},
          )
        ],
      ),
    ],
  );
}
