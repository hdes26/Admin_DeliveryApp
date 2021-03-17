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
        title: Text("Platos"),
      ),
    );
  }
}