import 'package:flutter/material.dart';

import './generator.dart';

void main() {
  //MazeGenerator;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maze generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Maze Generator"),
          backgroundColor: Colors.greenAccent,
        ),
        body: CustomPaint(
          painter: MazeGenerator(),
          child: Center(),
        ),
      ),
    );
  }
}
