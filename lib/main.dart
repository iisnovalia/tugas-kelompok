import 'package:flutter/material.dart';
import 'login.dart';
import 'mainmenu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "LAPORAN KEUANGAN CUCIFIKASI LAUDRY",
    theme: ThemeData(primaryColor: Colors.orange[500]),
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/pages/mainmenu': (context) => MainMenu(),
    },
  ));
}
