import 'package:flutter/material.dart';


class RegisterDomicilairy extends StatefulWidget {
  RegisterDomicilairy({Key key}) : super(key: key);

  @override
  _RegisterDomicilairyState createState() => _RegisterDomicilairyState();
}

class _RegisterDomicilairyState extends State<RegisterDomicilairy> {
  final _formKey = GlobalKey<FormState>();
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
        child: _FormData(),
      ),
      bottomNavigationBar: _button(context),
    );
  }
  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
        onPressed: (){
          if(_formKey.currentState.validate()){
            print('enviado');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Registrar Domiciliario',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  _FormData(){
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
            decoration: InputDecoration(),
            validator:(value){
              if(value.isEmpty){
                return 'ingrese su nombre';
              }else{
                return null;
              }
              
            }
          ),
          SizedBox(height: 15,),         
          Text('Apelllidos',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          TextFormField(
            decoration: InputDecoration(),
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(),
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(),
            validator:(value){
              
              if(value.length<10){
                return 'ingrese su numero de telefono';
              }else{
                return null;
              }
              
            }
          ),
        ],
      ),
    ));
}
}
