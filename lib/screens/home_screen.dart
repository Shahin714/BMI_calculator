import 'dart:ui';

import 'package:bmi_application/widgets/backGround_shap_left.dart';
import 'package:bmi_application/widgets/backGround_shap_right.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _taptestState();
}

class _taptestState extends State<HomeScreen> {
  final weightcontoroler = TextEditingController();
  final tallcontoroler = TextEditingController();
  double resultBMI = 0;
  String resultText = '';
  double widthgood = 100;
  double widthbad = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'dana'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '?تو چنده BMI',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      child: TextField(
                        controller: weightcontoroler,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'وزن',
                          hintStyle: TextStyle(
                            color: Colors.orange.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      child: TextField(
                        controller: tallcontoroler,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'قد',
                          hintStyle:
                              TextStyle(color: Colors.orange.withOpacity(0.9)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    final height = double.parse(tallcontoroler.text);
                    final weight = double.parse(weightcontoroler.text);
                    setState(() {
                      resultBMI = weight / (height * height);
                      if (resultBMI > 25) {
                        widthgood = 70;
                        widthbad = 300;
                        resultText = 'شما اضافه وزن دارید';
                      } else if (resultBMI <= 25 && resultBMI >= 18.5) {
                        widthgood = 300;
                        widthbad = 70;

                        resultText = 'وزن شما نرمال است';
                      } else {
                        widthgood = 25;
                        widthbad = 25;

                        resultText = 'وزن شما کم است';
                      }
                    });
                  },
                  child: Text(
                    '! محاسبه کن ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${resultBMI.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 65),
                ),
                Text(
                  '${resultText}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 30,
                ),
                right_shape(
                  width: widthbad,
                ),
                left_shape(
                  width: widthgood,
                )
              ],
            ),
          )),
    );
  }
}
