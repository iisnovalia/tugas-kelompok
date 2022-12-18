import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keuangan/pages/about.dart';
import 'package:keuangan/pages/home.dart';
import 'package:keuangan/pages/mainmenu.dart';
import 'package:keuangan/pages/profile.dart';

class MainMenu extends StatefulWidget {
  final void signout;
  MainMenu(this.signout);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              shadowColor: Colors.transparent,
              title: Row(
                children: [
                  new Image.asset(
                    "gambar/logo.png",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  new Text(
                    "Buku Keuangan Digital",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    signOut();
                  },
                  color: Colors.white,
                  icon: Icon(Icons.exit_to_app),
                ),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                Home(),
                Profile(),
                About(),
              ],
            ),
            bottomNavigationBar: Container(
                padding: EdgeInsets.only(top: 50),
                height: 60,
                color: Colors.orange,
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.orange[900],
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.home),
                      child: new Text(
                        "Home",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.account_box),
                      child: new Text(
                        "Profile",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.addchart_rounded),
                      child: new Text(
                        "Statistic",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.info),
                      child: new Text(
                        "About",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ],
                ))));
  }

  void signOut() {}
}
