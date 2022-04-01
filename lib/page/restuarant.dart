// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/restuarant.dart';
import 'package:myapp/models/travel.dart';
import 'package:myapp/page/restuarantDetail.dart';
import 'package:myapp/page/travelDetail01.dart';

class RestuarantPage extends StatefulWidget {
  const RestuarantPage({Key? key}) : super(key: key);

  @override
  State<RestuarantPage> createState() => _RestuarantPageState();
}

class _RestuarantPageState extends State<RestuarantPage> {
  List<Widget> widgets = [];
  List<Restuarant> restuarants = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initializeApp Success');
      await FirebaseFirestore.instance
          .collection('Restaurant')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          Restuarant model = Restuarant.fromMap(map);
          restuarants.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(Restuarant model, int index) => GestureDetector(
        // onTap: () {
        //   print('You Click from index = $index');
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               RestuarantDetailPage(restuarant: restuarants[index])));
        // },
        child: Card(
          color: Colors.blue[100],
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(21),
          // ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: Image.network(
                      model.image,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    model.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          color: Colors.blue.withAlpha(50),
                          alignment: Alignment.center,
                          child: TextButton(
                            child: const Text('อ่านเพิ่มเติม'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RestuarantDetailPage(
                                              restuarant: restuarants[index])));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ร้านอาหาร'),
        backgroundColor: Color(0xFF283593),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: widgets,
            ),
    );
  }
}
