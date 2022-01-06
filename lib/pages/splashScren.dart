import 'dart:async';

import 'package:blogger/pages/MyHomePage.dart';
import 'package:flutter/material.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(milliseconds: 4000), (timer) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
    });
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Card(
        color: Colors.yellow[50],
        child: Center(
          child: Container(
            child: Column(children: [
              Image.asset('images/Image1.png'),
              Positioned(
                  top: 450.0,
                  left: 100.0,
                  child: Text(
                    "روايــــتـــــــــــــي",
                    style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        color: Colors.green),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
