import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var leftimgNo = 9;
  var rightimgNo = 8;
  var title = "ابدأ الان";

  void changeImage() {
    leftimgNo = Random().nextInt(8) + 1;
    rightimgNo = Random().nextInt(8) + 1;
    if (leftimgNo != rightimgNo) {
      title = "حاول مرة اخرى";
    } else {
      title = "مبروك كسبت اللعبة";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2196F3),
      appBar: AppBar(
        backgroundColor: const Color(0xff1976D2),
        title: Text("Simple Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(
          //   height: 200,
          // ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeImage();
                      });
                    },
                    child: Image.asset('assets/image/img$leftimgNo.png')),
                //flex: 5,//نسبة عرض الصور فى الشاشة
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image(
                    image: AssetImage('assets/image/img$rightimgNo.png'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
