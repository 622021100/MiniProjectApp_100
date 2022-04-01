import 'package:flutter/material.dart';
import 'package:myapp/page/cafe.dart';
import 'package:myapp/page/restuarant.dart';
import 'package:myapp/page/travel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/lipe1.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          toppic(context),
                        ],
                      ),
                    ),
                    const Text("เที่ยวสตูล หมู่เกาะสวย ทะเลน้ำใส",
                        style: TextStyle(
                            // fontFamily: 'Caveat',
                            fontSize: 16,
                            color: Colors.white)),
                    const Text("ดินแดนสวรรค์ล้ำค่าฝั่งทะเลอันดามัน",
                        style: TextStyle(
                            // fontFamily: 'Caveat',
                            fontSize: 16,
                            color: Colors.white)),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "@ SATUN TH",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          color: Color(0xFF18FFFF)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "หมวดหมู่",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      height: 350,
                      width: 400,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          InkWell(
                            child: makeItem(
                                image: 'assets/images/Lipe.jpg',
                                title: 'ที่ท่องเที่ยว'),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LipePage();
                              }));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: makeItem(
                                image: 'assets/images/01.webp',
                                title: 'ร้านอาหาร'),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RestuarantPage();
                              }));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: makeItem(
                                image: 'assets/images/02.webp',
                                title: 'ร้านคาเฟ่'),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const CafePage();
                              }));
                            },
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText toppic(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline5,
        children: const [
          TextSpan(
              text: "LET'S ",
              style: TextStyle(
                  fontSize: 40, color: Colors.white, fontFamily: 'Caveat')),
          TextSpan(
              text: " TRAVEL",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Comfortaa')),
        ],
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ])),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
