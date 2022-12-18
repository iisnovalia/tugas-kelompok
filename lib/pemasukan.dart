import 'dart:math';

import 'package:flutter/material.dart';

class Pemasukan extends StatefulWidget {
  @override
  State<Pemasukan> createState() => _PemasukanState();
}

class _PemasukanState extends State<Pemasukan> {
  late String Catatan;

  check() {
    print('masuk');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(' '),
                    TextFormField(
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Catatan Wajib di Isi";
                        }
                      },
                      onSaved: (e) => Catatan = int.parse(e!) as String,
                      maxLines: 1,
                      decoration: InputDecoration(labelText: '', hintText: ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(' '),
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(labelText: '', hintText: ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(' '),
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(labelText: '', hintText: ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(' '),
                    TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: '', hintText: ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        check();
                      },
                      child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(color: Colors.orange[900]),
                          child: Text(
                            "simpan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )))));
  }
}
