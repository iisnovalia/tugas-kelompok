import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  late String username, password;
  final _Key = new GlobalKey<FormState>();
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
    }
  }

  login() async {
    final response = await http.post(
        Uri.parse("http://192.168.10.193/keuangan/login.php"),
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Welcom Back",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: usernameController,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Please insert username";
                  }
                },
                onSaved: (e) => username = e!,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 40,
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12.0)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Please insert password";
                  }
                },
                obscureText: true,
                onSaved: (e) => password = e!,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 40,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12.0),
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
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
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
    );
  }
}
