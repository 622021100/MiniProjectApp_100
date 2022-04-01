// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/travel.dart';
import 'package:myapp/page/travelDetail01.dart';

class LipePage extends StatefulWidget {
  const LipePage({Key? key}) : super(key: key);

  @override
  State<LipePage> createState() => _LipePageState();
}

class _LipePageState extends State<LipePage> {
  List<Widget> widgets = [];
  List<Travel> travels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initializeApp Success');
      await FirebaseFirestore.instance
          .collection('Travel')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          Travel model = Travel.fromMap(map);
          travels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(Travel model, int index) => GestureDetector(
        // onTap: () {
        //   print('You Click from index = $index');
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => DetailPage(travel: travels[index])));
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
                  // Text(model.detail)
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
                                          DetailPage(travel: travels[index])));
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
        title: const Text('ที่ท่องเที่ยว'),
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
