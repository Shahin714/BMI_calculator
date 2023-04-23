import 'package:bmi_application/screens/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowMaterialGrid: false,
        theme: ThemeData(fontFamily: 'dana'),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
