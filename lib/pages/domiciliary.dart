import 'package:flutter/material.dart';

class Domiciliary extends StatefulWidget {
  Domiciliary({Key key}) : super(key: key);

  @override
  _DomiciliaryState createState() => _DomiciliaryState();
}

class _DomiciliaryState extends State<Domiciliary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Domiciliarios", style: TextStyle(color: Colors.grey)),
      ),
      body: Container(
        child: Text('domiciliarios que hay '),
      ),
      bottomNavigationBar: _ButtonEdit(context),
    );
  }
}
_ButtonEdit(BuildContext context){
  return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
        onPressed: ()=>Navigator.pushNamed(context,'registerDomiciliary',arguments: {'name':'Registro Domiciliario'}),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Registrar domiciliario',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
}