import 'package:flutter/material.dart';
import 'package:keuangan/launcher.dart';
import 'package:keuangan/pages/Login.dart';
import 'package:keuangan/pages/mainmenu.dart';
import 'constans/constans.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "LAPORAN KEUANGAN CUCIFIKASI LAUDRY",
    home: launcher(),
    theme: ThemeData(primaryColor: Colors.orange[500]),
    routes: {
      SPLASH_SCREEN: (context) => launcher(),
      HOME_SCREEN: (context) => Login(),
    },
  ));
}
