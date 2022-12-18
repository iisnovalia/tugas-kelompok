import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keuangan/pemasukan.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<String> imgSlider = ['1.jpg', '2.jpg', '3.jpg', '4.jpg'];
  final CarouselSlider aoutoPlayImage = CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'gambar/slider' + '/${fileImage}',
            fit: BoxFit.fill,
          ),
        ),
      );
    }).toList(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Selamat Datang di Halaman Home'),
            ),
            SizedBox(
              height: 10,
            ),
            aoutoPlayImage,
            MenuUtama(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.orange,
                  child: Center(
                      child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("saldo terakhir anda")],
                    )
                  ])),
                ))
          ],
        )),
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            childAspectRatio: 4 / 3,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Pemasukan()));
            },
          ),
          Card(
              color: Colors.orange,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'gambar/pemasukann.png',
                        width: 50,
                        height: 50,
                      ),
                      Text('PEMASUKAN')
                    ],
                  ))),
          Card(
              color: Colors.orange,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'gambar/pengeluaran.png',
                        width: 50,
                        height: 50,
                      ),
                      Text('PENGELUARAN')
                    ],
                  ))),
          Card(
              color: Colors.orange,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'gambar/pemasukann.png',
                        width: 50,
                        height: 50,
                      ),
                      Text('LAPORAN PEMASUKAN')
                    ],
                  ))),
          Card(
              color: Colors.orange,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'gambar/pengeluaran.png',
                        width: 50,
                        height: 50,
                      ),
                      Text('LAPORAN PENGELUARAN')
                    ],
                  ))),
        ]));
  }
}
