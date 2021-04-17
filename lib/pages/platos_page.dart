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
  List<dynamic> platosList = [];
  bool remove;
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
        bottomNavigationBar: _button(context),
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: _builderPlatos(context),
        ));
  }

  Widget _platos(Plato data, BuildContext context, int index) {
    final infoProvider = Provider.of<InfoProvider>(context);
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: Container(
        color: Color(0x9DEB1515),
      ),
      onDismissed: (direccion) {
        // PlatosProvider().delete(data.id, infoProvider.token);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(data.nombre,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onTap: () async {
                  await Navigator.pushNamed(context, 'editPlato', arguments: {
                    "id": data.id,
                    "nombre": data.nombre,
                    "precio": data.precio,
                    // "nombre categoria": data.categoryId['nombre'],
                    "ingredientes": data.ingredientes
                  });
                  setState(() {});
                },
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 27,
            thickness: 1.1,
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  _builderPlatos(BuildContext context) {
    final infoProvider = Provider.of<InfoProvider>(context);
    print(" info prvider token" + infoProvider.token);
    return FutureBuilder(
      future: PlatosProvider().getAll(infoProvider.token),
      builder: (BuildContext context, AsyncSnapshot<List<Plato>> snapshot) {
        platosList = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            physics: ScrollPhysics(parent: ScrollPhysics()),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            itemBuilder: (BuildContext context, int index) {
              return _platos(snapshot.data[index], context, index);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xF2EB1515)),
        onPressed: () {
          Navigator.pushNamed(context, 'registroPlato');
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Registrar Plato',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
