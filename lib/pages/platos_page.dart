import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/platoModel.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/platosProdiver.dart';
import 'package:provider/provider.dart';

class Platos extends StatefulWidget {
  Platos({Key key}) : super(key: key);

  @override
  _PlatosState createState() => _PlatosState();
}

class _PlatosState extends State<Platos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Platos", style: TextStyle(color: Colors.grey)),
        ),
        // bottomNavigationBar: Container(
        //   width: 50,
        //   height: 50,
        //   color: Colors.grey,
        //   child: Center(
        //     child: Text('REGISTRAR NUEVO PLATO'),
        //   ),
        // ),
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: _builderPlatos(context),
          // child: ListView(
          //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          //   children: [
          //     _platos("Perrascamelo", context),
          //     Divider(
          //       color: Colors.black,
          //       thickness: 1.1,
          //       height: 27,
          //     ),
          //     _platos("Perro gemelo", context),
          //     Divider(
          //       color: Colors.black,
          //       height: 27,
          //       thickness: 1.1,
          //     ),
          //     _platos("Perro suizo", context),
          //     Divider(
          //       color: Colors.black,
          //       height: 27,
          //       thickness: 1.1,
          //     ),
          //     _platos("perro secillo", context),
          //     Divider(
          //       color: Colors.black,
          //       height: 27,
          //       thickness: 1.1,
          //     ),
          //     _platos("hamburguesa de carne", context),
          //     Divider(
          //       color: Colors.black,
          //       height: 27,
          //       thickness: 1.1,
          //     ),
          //             InkWell(
          //   child:
          //   onTap: () => {Navigator.pushNamed(context, 'registroPlato')},
          // )
          //   ],

          // ),
        ));
  }
}

Widget _platos(Plato data, BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.nombre,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            children: [
              InkWell(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                  child: Icon(Icons.edit, size: 40),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, 'editPlato', arguments: {
                    "nombre": data.nombre,
                    "precio": data.precio,
                    "nombre categoria": data.categoryId
                  })
                },
              ),
              SizedBox(
                width: 30,
              ),
              InkWell(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: Icon(Icons.delete_forever, size: 40),
                ),
                onTap: () => {print("object1")},
              )
            ],
          ),
        ],
      ),
      Divider(
        color: Colors.black,
        height: 27,
        thickness: 1.1,
      ),
    ],
  );
}

Widget _builderPlatos(BuildContext context) {
  final infoProvider = Provider.of<InfoProvider>(context);
  return FutureBuilder(
    future: PlatosProvider().getAll(infoProvider.token),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.hasData) {
        // return Text("hola");
        return ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          itemBuilder: (BuildContext context, int index) {
            return _platos(snapshot.data[index], context);
          },
        );
        // return SingleChildScrollView(
        //   child: Column(

        //    _ card(snapshot.data., AssetImage('assets/img/burger.jpg'),
        //         "5.000"),
        //     SizedBox(
        //       height: 15.0,
        //     ),
        //   ),
        // );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
