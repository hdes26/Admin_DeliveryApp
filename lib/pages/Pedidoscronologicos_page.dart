import 'package:flutter/material.dart';

class PedidosCronologicos extends StatefulWidget {
  PedidosCronologicos({Key key}) : super(key: key);

  @override
  _PedidosCronologicosState createState() => _PedidosCronologicosState();
}

class _PedidosCronologicosState extends State<PedidosCronologicos> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
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
                  "20.000",
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
                  "Calle 132 #56-43",
                  style: TextStyle(fontSize: 20.0, fontFamily: "Chonburi"),
                ),
                SizedBox(),
              ],
            ),

//Linea
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20, 80, 20, 0)),
                Container(
                  width: 330,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            ),

            Row(
              children: [
                Text('1 Perro suizo'),
              ],
            ),
            Row(
              children: [
                Text("1 Papas medianas"),
              ],
            ),
            Row(
              children: [
                Text("2 hamburguesas de carne"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
