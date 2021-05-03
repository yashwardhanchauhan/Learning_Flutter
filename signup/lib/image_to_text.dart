import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image to Text Translation")),
        backgroundColor: Colors.black,
      ),
    );
  }
}