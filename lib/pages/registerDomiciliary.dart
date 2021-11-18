import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/domiciliarioModel.dart';
import 'package:flutter_application_1/providers/domicliariosProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';


class RegisterDomicilairy extends StatefulWidget {
  RegisterDomicilairy({Key key}) : super(key: key);

  @override
  _RegisterDomicilairyState createState() => _RegisterDomicilairyState();
}

class _RegisterDomicilairyState extends State<RegisterDomicilairy> {
  final _formKey = GlobalKey<FormState>();
  Domiciliarios domiciliario = new Domiciliarios();
  final domiciliarioProvider = new DomiciliarioProvider();

  String name;


  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(parametros['name'], style: TextStyle(color: Colors.grey)),
      ),
      body: SingleChildScrollView(
        child: _formData(parametros['domiciliario']),
      ),
      bottomNavigationBar: _button(context,parametros['name'],parametros['domiciliario']),
    );
  }
  Widget _button(BuildContext context,String title,Domiciliarios parametro) {
    print(title.trim());
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async{
          if(title.trim()=='Registro Domiciliario'){
            if(_formKey.currentState.validate()){
            final infoProvider= Provider.of<InfoProvider>(context,listen: false);
            _formKey.currentState.save();
           
            String response = await domiciliarioProvider.createDomicilary(infoProvider.token,parametro);
            
            _formKey.currentState.reset();
            if(response=='domiciliario guardado correctametne'){
              _mostrarAlert(response);
            }else{
              _mostrarAlert(response);
            }
            
          }
          }else if(title.trim()=='Editar Domiliciario'){
            if(_formKey.currentState.validate()){
              final infoProvider= Provider.of<InfoProvider>(context,listen: false);
              _formKey.currentState.save();

              String response = await domiciliarioProvider.domiciliaryUpdate(infoProvider.token, parametro);
              print(response);
              _formKey.currentState.reset();
              if(response=='domiciliario actualizado correctamente'){
                _mostrarAlert(response);
              }else{
              _mostrarAlert(response);
              }

            }
            print(parametro.id);
          }
        },
        
      ),
    );
  }
  _formData(Domiciliarios domiciliario){
   
    
  return Form(
    key: _formKey,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(height: 15,),         
          Text('Nombre',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          TextFormField(
            initialValue: domiciliario.nombre,
            decoration: InputDecoration(),
            onSaved: (value)=>domiciliario.nombre=value,
            validator:(value){
              if(value.isEmpty){
                return 'ingrese su nombre';
              }else{
                return null;
              }
              
            }
          ),
          SizedBox(height: 15,),         
          Text('Apellidos',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          TextFormField(
            initialValue: domiciliario.apellidos,
            decoration: InputDecoration(),
            onSaved: (value)=>domiciliario.apellidos=value,
            validator:(value){
              if(value.isEmpty){
                return 'ingrese su apellidos';
              }else{
                return null;
              }
            }
          ),
          SizedBox(height: 15,),
          Text('Cedula',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          TextFormField(
            initialValue: domiciliario.cedula.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(),
            onSaved: (value){
              final values = value.trim();
              domiciliario.cedula= int.parse(values);
              },
            validator:(value){
              if(value.length<6){
              return 'ingrese su cedula';
            }else{
              return null;
            }
            }
          ),
          SizedBox(height: 15,),
          Text('Telefono',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          TextFormField(
            initialValue: domiciliario.numero.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(),
            onSaved: (value){
              final values = value.trim();
              domiciliario.numero= int.parse(values);
            },
            validator:(value){
              if(value.length==10){
                return null;
              }else{
                return 'ingrese su numero de telefono';
              }
              
            }
          ),
         
        ],
      ),
    ));
}
_mostrarAlert(String message) {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                child: Text('Ok', style: TextStyle(fontSize: 20)),
                onPressed: (){
                  if(message=='domiciliario guardado correctametne'|| message=='domiciliario actualizado correctamente'){
                    Navigator.of(context).pushNamedAndRemoveUntil('domiciliary', ModalRoute.withName('home'));
                  }else{
                    Navigator.of(context).pop();
                  }
                }
              )
            ],
          );
        });
  }

}
