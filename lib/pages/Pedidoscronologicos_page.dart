import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PedidosCronologicos extends StatefulWidget {
  PedidosCronologicos({Key key}) : super(key: key);

  @override
  _PedidosCronologicosState createState() => _PedidosCronologicosState();
}

class _PedidosCronologicosState extends State<PedidosCronologicos> {
 String estados = "preparando";
  @override
  Widget build(BuildContext context) {
    Map parametros = ModalRoute.of(context).settings.arguments;
    
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Pedidos #1",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
//Fila 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Chonburi",
                  ),
                ),
                SizedBox(),
                Text(
                  parametros['total'],
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
//Fila 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Hora",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                SizedBox(),
                Text(
                  "12:00:00",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
//Fila 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "Dir. entrega",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                Text(
                  parametros['direccion'],
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                SizedBox(),
              ],
            ),

//Linea
            Divider(
              thickness: 2,
              color: Colors.black,
              height: 50.0,
            ),

            Row(
              children: [
                Text(parametros['plato'], style: TextStyle(fontSize: 20.0),),
              ],
            ),
           
           
                        Divider(
              thickness: 2,
              color: Colors.black,
              height: 50.0,
            ),
            Row(
              children: [
                Text("Especificaciones", style: TextStyle(fontSize: 22.0),),
              ],
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              maxLength: 2000,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Perro sin cebolla, hamburguesa sin pan xd',
              ),
            ),
            Row(children: [
              Text('Estado: ',style:TextStyle(fontSize: 17),),
              DropdownButton(
              value: estados,
              items: [
                DropdownMenuItem(
                  child: Text(parametros['estado']),
                  value: "preparando",
                ),
                DropdownMenuItem(
                  child: Text("enviado"),
                  value: "enviado",
                ),
                DropdownMenuItem(
                  child: Text("por confirmar"),
                  value: "por confirmar"
                ),
                
              ],
              onChanged: (value) {
                setState(() {
                estados=value;
                });
              
              })
              ]
             ,),
          ],
        ),
      ),
    );
  }
}

