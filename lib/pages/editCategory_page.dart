import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_1/models/categoriaModel.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/categoriasProvider.dart';
import 'package:provider/provider.dart';


class EditCategory extends StatefulWidget {
  EditCategory({Key key}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  getUserData() async {
    Map parametrosCategoria = ModalRoute.of(context).settings.arguments;
    final infoProvider = Provider.of<InfoProvider>(context);
    var url = 'https://backend-delivery.azurewebsites.net/api/category/';
    var id = parametrosCategoria;
    var headerToken = 'x-access-token';
    final response = await http.get(
      Uri.parse(url+id["id"]),
      headers: { 
        headerToken:infoProvider.token
      },
    );
    
    final jsonData = jsonDecode(response.body);
            print(jsonData['category']);
             print(jsonData['category']["_id"]);
            print(jsonData['category']["nombre"]);
            
    return jsonData["category"];
  }

  final formKey = GlobalKey<FormState>();
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
                              
                              child: Text('Editando categoria...'),                         
                                                 ),
                                     );
                 }      
                 else return Container(color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          children: [
            
            _formCategory(snapshot.data["_id"], snapshot.data["nombre"]),
          ],
        ),
        );
                  
                   
                  
                       
                       },
         ),
     ),
    );
      
  }

  Widget _formCategory(String dataid, String datanombre) {
    TextEditingController _textController = TextEditingController(text: "");

    return Column(children: [
      Padding(padding: EdgeInsets.all(10)),
      TextFormField(
        
        controller: _textController,
        autofocus: true,
        decoration: InputDecoration(
          
            hintText: datanombre,
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            focusColor: Colors.red),
        onFieldSubmitted: (value) =>
            {Navigator.pushNamed(context, 'searchPlato')},
      ),
      _buttonSend(dataid,datanombre, context, _textController)
    ],
      
    );
  }

  Widget _buttonSend( String dataid, String datanombre, BuildContext context, dynamic textController) {
    
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
        onPressed: () => {print(textController.text),
        Navigator.pushNamed(context, 'editarcategoria2', arguments: {
          
          "id":dataid,
          "nombre":textController.text}
          )}
     );
  }



}
















