import 'package:flutter/material.dart';
import 'package:myapp/page/travel.dart';
import 'package:myapp/screens/homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lipe2.png'),
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.blue, BlendMode.darken)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 85, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 250, 35, 0),
                child: Column(
                  children: [
                    // logo(),
                    sublogo(),
                    satun()
                  ],
                ),
              ),
              welcomebutton(context),
            ],
          ),
        ),
      ),
    );
  }

  Text satun() {
    return const Text(
      "@ SATUN TH",
      style: TextStyle(fontSize: 25, fontFamily: 'Caveat'),
    );
  }

  Row sublogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcome(),
        welcome1(),
      ],
    );
  }

  // Widget logo() {
  //   return Container(
  //       width: 120,
  //       height: 120,
  //       child: Image.asset('assets/images/bitcoin.png'));
  // }

  Padding welcome1() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "TRAVEL.",
        style: TextStyle(
            fontSize: 40,
            color: Color(0xFF01579B),
            fontWeight: FontWeight.w900),
      ),
    );
  }

  Padding welcome() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "LET'S ",
        style: TextStyle(
          fontSize: 40,
          color: Color(0xFFF8F8F8),
          // fontWeight: FontWeight.w600
        ),
      ),
    );
  }

  Padding welcomebutton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))),
            backgroundColor: MaterialStateProperty.all(const Color(0xFF222B45)),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          child: const Text(
            "Let's Go",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
