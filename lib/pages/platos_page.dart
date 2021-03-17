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
              _platos("Perrascamelo", context),
              Divider(
                color: Colors.black,
                thickness: 1.1,
                height: 27,
              ),
              _platos("Perro gemelo", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("Perro suizo", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("perro secillo", context),
              Divider(
                color: Colors.black,
                height: 27,
                thickness: 1.1,
              ),
              _platos("hamburguesa de carne", context),
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
            onTap: () => {Navigator.pushNamed(context, 'editPlato')},
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
