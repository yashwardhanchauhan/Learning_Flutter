import 'package:flutter/material.dart';
class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Text to Text Translation")),
        backgroundColor: Colors.black,
      ),
    );
  }
}