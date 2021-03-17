import 'package:flutter/material.dart';

class Platos extends StatefulWidget {
  Platos({Key key}) : super(key: key);

  @override
  _PlatosState createState() => _PlatosState();
}

class _PlatosState extends State<Platos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Platos", style: TextStyle(color: Colors.grey)),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              _platos("Perro caliente", context),
              Divider(
                color: Colors.black,
                thickness: 1.1,
                height: 27,
              ),
              _platos("Salchipapa", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("pizza", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("hamburguesas", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("bebidas", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
            ],
          ),
        ));
  }
}

Widget _platos(String text, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
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
