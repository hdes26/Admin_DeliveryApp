import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/domiciliarioModel.dart';
import 'package:flutter_application_1/providers/domicliariosProvider.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class Domiciliary extends StatefulWidget {
  Domiciliary({Key key}) : super(key: key);

  @override
  _DomiciliaryState createState() => _DomiciliaryState();
}

class _DomiciliaryState extends State<Domiciliary> {
  final domiciliarioProvider = DomiciliarioProvider();
  

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
      body: Container(child: content(context)),
      bottomNavigationBar: _buttonEdit(context),
    );
  }

  Widget content(BuildContext context) {
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    return FutureBuilder(
        future: domiciliarioProvider.getAll(infoProvider.token),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                itemBuilder: (BuildContext context, int index) {
                  
                  return itemDomiciliary(snapshot.data[index]);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
  Widget itemDomiciliary(Domiciliarios domiciliario) {
    final infoProvider = Provider.of<InfoProvider>(context,listen: false);
  return InkWell(
    child: Dismissible(
        key: ValueKey<String>(domiciliario.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          child:Icon(Icons.delete,size: 32, )
        ),
        
        child: Column(
          children: [
            ListTile(
              title: Text(domiciliario.nombre+' '+domiciliario.apellidos,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
            Divider(
              thickness: 1,
              height: 1,
            )
          ],
        ),
        confirmDismiss: (direction)async{
          return showDialog(
            
            context: context, 
            builder: (_){
              return AlertDialog(
                title: Text('Eliminar Domiciliario'),
                content: Text('¿Estas seguro que desea eliminar este domiciliario?'),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    }, 
                    child: Text('Si',style: TextStyle(fontSize: 18),)),
                  TextButton(
                    child: Text('No',style: TextStyle(fontSize: 18)),
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    }
                    ),
                  
                ],
              );
            });
        },
        onDismissed: (direction)async{
          
          bool info =await domiciliarioProvider.deleteDomiciliary(infoProvider.token, domiciliario.id);
          print("El domiciliario se elimino? "+info.toString());
        },
        ),
        onTap: (){
          Navigator.pushNamed(context, 'registerDomiciliary',arguments: {'name':'Editar Domiliciario','domiciliario':domiciliario});
        },
  );

}
}



_buttonEdit(BuildContext context) {
  Domiciliarios domiciliario= new Domiciliarios(cedula: 0,numero: 0,nombre: '',apellidos: '');
  return Padding(
    padding: const EdgeInsets.all(20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
      onPressed: () {
        
        Navigator.pushNamed(context, 'registerDomiciliary',
          arguments: {'name': 'Registro Domiciliario','domiciliario':domiciliario});},
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
