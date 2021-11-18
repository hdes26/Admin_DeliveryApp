
import 'dart:convert';
import 'package:flutter_application_1/models/domiciliarioModel.dart';
import 'package:http/http.dart' as http;


class DomiciliarioProvider {

  String _url='backend-delivery2.azurewebsites.net';

  Future <List<Domiciliarios>> getAll (String token) async{

    final url = Uri.https(_url, 'api/domiciliario/');
    print(token);
    final response = await http.get(url,headers: {'x-access-token':token});
    final respDecode = json.decode(response.body);
    
    final domiciliario = new Domiciliario.fromToList(respDecode['domiciliarios']);
    return domiciliario.domi;

  }
  
  Future <String> createDomicilary(String token,Domiciliarios domiciliario)async{
   
    final url = Uri.https(_url,'api/domiciliario/registro/');
    final Map<String,dynamic>jsons={
      'cc':domiciliario.cedula,
      'nombre':domiciliario.nombre,
      'apellidos':domiciliario.apellidos,
      'numero':domiciliario.numero,
      
    };
     
    final response =await  http.post(url,headers: {'x-access-token':token,'Content-Type':'application/json'},body:json.encode(jsons));
    final respDecode = json.decode(response.body);
    
    return respDecode['message'];
  }
  Future <String> domiciliaryUpdate(String token, Domiciliarios domiciliario)async{
    print("Peticion==="+domiciliario.id);
    final url = Uri.https(_url,'api/domiciliario/update/'+domiciliario.id);
    final Map<String,dynamic>jsons={
      'cc':domiciliario.cedula,
      'nombre':domiciliario.nombre,
      'apellidos':domiciliario.apellidos,
      'numero':domiciliario.numero,
      
    };
    final response = await http.put(url,headers: {'x-access-token':token,'Content-Type':'application/json'},body:json.encode(jsons));
    final respDecode = json.decode(response.body);

    return respDecode['messagee'];

  }

  Future <bool> deleteDomiciliary(String token, String id)async{

    final url = Uri.https(_url, 'api/domiciliario/remove/'+id);
    final response = await http.delete(url,headers: {'x-access-token':token});
    final respDecode = json.decode(response.body);
    print(respDecode);
    if(respDecode['message']=='domiciliario eliminado correctamente'){
      return true;
    }else{
      return false;
    }
  }
  
}