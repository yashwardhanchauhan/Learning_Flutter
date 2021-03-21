import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text("Make In India Initiative",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black,)),
      loadingText: Text("Loading"),
      seconds: 10,
      navigateAfterSeconds: Home(),
      image: Image.asset('asset/download.jpg'),
      photoSize: 150,
      backgroundColor: Colors.grey[300],
      loaderColor: Colors.black,

    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Home"),
      ),

    );
  }
}
