import 'package:flutter/material.dart';

class Myvoice extends StatefulWidget {
  @override
  _MyvoiceState createState() => _MyvoiceState();
}

class _MyvoiceState extends State<Myvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Voice to Text Translation")),
        backgroundColor: Colors.black,
      ),
    );
  }
}
