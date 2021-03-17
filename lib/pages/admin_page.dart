import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEEEEEEEEEE),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0))),
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  'assets/perrascamelo.png',
                  height: 200,
                )),
                Center(
                    child: Text(
                  'ADMIN',
                  style: TextStyle(fontFamily: 'Chonburi', fontSize: 20),
                )),
                Center(
                    child: Text('Perrascamelo',
                        style:
                            TextStyle(fontFamily: 'Chonburi', fontSize: 20))),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(7.0),
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Pedidos pendientes',
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Chonburi'),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*Column(children: [  
      
      Row(        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        Text('Pedidos pendientes',
        style: TextStyle(fontSize: 18.0, fontFamily:'Chonburi'),),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){}),
      ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Categorias',
        style: TextStyle(fontSize: 18.0, fontFamily:'Chonburi'),),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){})
      ],),
      
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
        Text('Platos',
        style: TextStyle(fontSize: 18.0, fontFamily:'Chonburi'),),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){})
      ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Historial de pedidos',
        style: TextStyle(fontSize: 18.0, fontFamily:'Chonburi'),),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){})
      ],)

    ],), */
