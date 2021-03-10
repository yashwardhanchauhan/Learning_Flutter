import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "First App",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  String heart  = '❤️';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to My First Project"),
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: Container(
          child: Text("Hey "+heart),
        ),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
