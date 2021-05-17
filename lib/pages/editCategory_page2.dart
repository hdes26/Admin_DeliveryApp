
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';



class Editarcategoria2 extends StatefulWidget {
  Editarcategoria2({Key key}) : super(key: key);

  @override
  _Editarcategoria2State createState() => _Editarcategoria2State();
}

class _Editarcategoria2State extends State<Editarcategoria2> {
  getUserData() async {
    Map parametrosCategoria = ModalRoute.of(context).settings.arguments;
    final infoProvider = Provider.of<InfoProvider>(context);
    var url = 'https://backend-delivery.azurewebsites.net/api/category/update/';
    var id= parametrosCategoria;
    var headerToken = 'x-access-token';
    final response =  await http.put(
      Uri.parse(url+id["id"]),
      headers: {
        headerToken:infoProvider.token
      },
      body:{"nombre":id["nombre"]},
    );
    
    final jsonData = jsonDecode(response.body);
          print(id["id"]);
          print(jsonData["message"]);

    return jsonData;
  }

  @override  
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Editacion de categoria'),),
      body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: getUserData(),
            builder: (context,snapshot){
                 if (snapshot.data == null) {
                     return Container(
                        child: Center(
                              child: Text('Editanto categoria...'),
                                                 ),
                                     );
                 }
                 else return Container(
                   child: Center(child: Text('Categoria editada satisfactoriamente'),
                   ),
                 );
           },
         ),
     ),
    );
  }
  }



