import 'package:flutter/material.dart';

import 'app.dart';
import 'preferencias_usuario/preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  print("TOKEN INICIAL :" + prefs.token);

  runApp(MyAPP());
}
