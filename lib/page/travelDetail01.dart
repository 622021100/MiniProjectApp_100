import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/travel.dart';

class DetailPage extends StatefulWidget {
  final Travel travel;
  DetailPage({Key? key, required this.travel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Travel model;
  List<Widget> widgets = [];
  List<Travel> travels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.travel;
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initializeApp Success');
      await FirebaseFirestore.instance
          .collection('Travel')
          .where('name', isEqualTo: 'ถ้ำเลสเตโกดอน')
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      width: 350,
                      child: Column(
                        children: [
                          Image.network(
                            model.image,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.name,
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(model.address),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.detail,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(model.name == null ? 'Read Travel' : model.name),
            backgroundColor: Color(
              0xFF283593,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(model.image),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(model.address),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  model.detail,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 150,
                  width: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Image.network(model.image),
                      Image.network(model.image),
                      Image.network(model.image)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
