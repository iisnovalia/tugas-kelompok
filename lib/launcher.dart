import 'dart:async';

import 'package:flutter/material.dart';

import 'constans/constans.dart';

class launcher extends StatefulWidget {
  const launcher({super.key});

  @override
  State<launcher> createState() => _launcherState();
}

class _launcherState extends State<launcher>
    with SingleTickerProviderStateMixin {
  var _visble = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationpage);
  }

  void navigationpage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visble = !_visble;
    });
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: Container(
        decoration: BoxDecoration(color: Colors.orange[500]),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Image.asset(
                  'gambar/logo.png',
                  width: animation.value * 100,
                  height: animation.value * 100,
                ),
                new Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                new Text(
                  "LAPORAN KEUANGAN CUCIFIKASI LAUDRY",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
