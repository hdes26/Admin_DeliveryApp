
import 'dart:convert';
import 'package:flutter_application_1/models/domiciliarioModel.dart';
import 'package:http/http.dart' as http;


class DomiciliarioProvider {

  String _url='backend-delivery2.azurewebsites.net';

  //traer todos los domiciliarios del BACKEND
  Future <List<Domiciliarios>> getAll (String token) async{

    final url = Uri.https(_url, 'api/domiciliario/');
    
    final response = await http.get(url,headers: {'x-access-token':token});
    final respDecode = json.decode(response.body);
    
    final domiciliario = new Domiciliario.fromToList(respDecode['domiciliarios']);
    return domiciliario.domi;

  }
  
  //Crear un domiciliarios en BACKEND
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

  //Actualizar un domiciliario en el BACKEND
  Future <String> domiciliaryUpdate(String token, Domiciliarios domiciliario)async{
    
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

  //Borrar un domiciliario del BACKEND
  Future <bool> deleteDomiciliary(String token, String id)async{

    final url = Uri.https(_url, 'api/domiciliario/remove/'+id);
    final response = await http.delete(url,headers: {'x-access-token':token});
    final respDecode = json.decode(response.body);
    
    if(respDecode['message']=='domiciliario eliminado correctamente'){
      return true;
    }else{
      return false;
    }
  }

  //Traer todos los domiciliarios disponibles
  Future<List<Domiciliarios>> domiciliaryAvailable(String token)async{
    
    final url = Uri.https(_url, 'api/domiciliario/disponibles');

    final response =await http.get(url,headers: {'x-access-token':token});
    final respDecode = json.decode(response.body);
    
    if(respDecode['message']=='no hay domiciliarios registrados'){
      final domicilirario= new Domiciliarios(id:'');
      return [domicilirario];
    }else{
      final domiciliarios = new Domiciliario.fromToList(respDecode['domiciliarios']);
      return domiciliarios.domi;
    }
    
  }

  //Asignar pedidos a domiciliario Backend

  Future <String> assingDomiciliary(String token,String pedidoId,String domiciliarioId)async{
    final url = Uri.https(_url, 'api/pedido/asignarDomiciliario');
    final response =await http.post(url,
    headers: {'x-access-token':token},
    body: {
      
      "pedido_id":pedidoId,
      "domiciliario_id":domiciliarioId,

    });
    final respDecode = json.decode(response.body );
    
    return respDecode['message'];
  }
  
}