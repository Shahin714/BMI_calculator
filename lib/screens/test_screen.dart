import 'package:flutter/material.dart';

class taptest extends StatefulWidget {
  const taptest({Key? key}) : super(key: key);

  @override
  State<taptest> createState() => _taptestState();
}

class _taptestState extends State<taptest> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              Text(
                '$counter',
                style: TextStyle(color: Colors.blueAccent, fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = counter + 1;
                  });
                },
                child: Text('click'),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    counter = counter + 1;
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
