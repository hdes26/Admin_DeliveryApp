import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/platoModel.dart';
import 'package:flutter_application_1/providers/infoProvider.dart';
import 'package:flutter_application_1/providers/platosProdiver.dart';
import 'package:provider/provider.dart';

bool showAlertDialog(BuildContext context, Plato plato) {
  final infoProvider = Provider.of<InfoProvider>(context, listen: false);
  bool response;
  // set up the buttons
  // ignore: deprecated_member_use
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
      response = false;
      return response;
    },
  );
  // ignore: deprecated_member_use
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      print(plato.id);
      // PlatosProvider().delete(plato.id, infoProvider.token);
      // showAlertDialog(context, plato);
      Navigator.pop(context);
      response = true;
      
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("esta seguro que decea eliminar el plato " + plato.nombre),
    actions: [
      cancelButton,
      continueButton,
    ],
    
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertConfirm(BuildContext context, Plato plato) {
  // set up the buttons
  // ignore: deprecated_member_use

  // ignore: deprecated_member_use
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("plato: " + plato.nombre + " eliminado correctamente"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
