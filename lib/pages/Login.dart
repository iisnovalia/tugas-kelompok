import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keuangan/pages/mainmenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

enum LoginStatus { notSignIn, signin }

class _LoginState extends State<Login> {
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  final _Key = GlobalKey<FormState>();
  bool _isHidePassword = true;
  bool _secureText = true;
  bool _apiCall = false;

  shwoHide() {
    if (this.mounted) {
      setState(() {
        _secureText = !_secureText;
      });
    }
  }

  check() {
    final form = _Key.currentState;
    if (form!.validate()) {
      form.save();
      if (this.mounted) {
        setState(() {
          _apiCall = true;
        });
      }
      login();
    }
  }

  final globalScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  //buat fungsi sncackbar / messagbox
  void _snackbar(String str) {
    if (str.isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      backgroundColor: Colors.green,
      content: new Text(str,
          style: new TextStyle(fontSize: 15.0, color: Colors.white)),
      duration: new Duration(seconds: 5),
    ));
  }

  login() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2/keuangan/login.php"));
    final data = jsonDecode(response.body);

    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      //menampung data json ke variabel
      String usernameAPI = data['user'];
      String namaAPI = data['nama'];
      String id = data['id'];

      if (this.mounted)
        setState(() {
          //rubah status login jika sudah login langsung di simpan ke prefences
          _loginStatus = LoginStatus.signin;
          savePref(value, usernameAPI, namaAPI, id);
        });
      _snackbar(pesan);
    } else {
      _snackbar(pesan);
      if (this.mounted) {
        setState(() {
          _apiCall = false;
        });
      }
    }
  }

  // buat fungsi prefences untuk simpan data hasil login
  savePref(int value, String username, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (this.mounted) {
      setState(() {
        preferences.setInt("value", value);
        preferences.setString("nama", nama);
        preferences.setString("username", username);
        preferences.setString("id", id);
        preferences.commit();
      });
    }
  }

  //buat fungsi getpref untuk ambil value atau ngecek status loginnya itu apa jika 1 berarti sudah login jika 0 berarti logout

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signin : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (this.mounted) {
      setState(() {
        _apiCall = false;
        preferences.setInt("value", value);
        preferences.commit();
        _loginStatus = LoginStatus.notSignIn;
      });
    }
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          key: globalScaffoldKey,
          backgroundColor: Colors.orange,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: _Key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Welcom Back",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: TextField(
                        controller: textControllerUsername,
                        decoration: InputDecoration(
                          //hintText: 'Username'

                          fillColor: Colors.lightGreen[40],
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          labelText: "Username",
                          hintText: 'Input Username anda',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: TextField(
                        controller: textControllerPassword,
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          //hintText: 'Password'

                          fillColor: Colors.lightGreen[40],
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                          labelText: "Password",
                          hintText: 'Input Pawssord anda',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w200),
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color:
                                  _isHidePassword ? Colors.grey : Colors.blue,
                            ),
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        check();
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(color: Colors.orange[900]),
                        child: Center(
                            child: _apiCall
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : Text(
                                    "Masuk",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        // ignore: dead_code
        break;
      case LoginStatus.signin:
        return MainMenu(signOut);
        // ignore: dead_code
        break;
    }
  }
}
