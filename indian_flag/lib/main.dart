import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Indian Flag",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Indian Flag",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
            color:Colors.black
          ),
        ),
        centerTitle: true,
       flexibleSpace: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [Colors.orange[900],Colors.white,Colors.green[900]],
             ),
          ),
        ),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Container(
              width: 200,
              height: 50,
              color: Colors.orange[900],
            ),
            Container(
              width: 200,
              height: 50,
              color: Colors.white,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[900]
                   ),

                )
                ),
            ),
            Container(
              width: 200,
              height: 50,
              color: Colors.green[900],
            )
          ],

        ) ,
        ),
    );
  }
}
