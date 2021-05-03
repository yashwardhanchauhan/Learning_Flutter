import 'package:flutter/material.dart';
import 'package:signup/image_to_text.dart';
import 'package:signup/main.dart';
import 'package:signup/second.dart';
import 'package:signup/text_to_text.dart';
import 'package:signup/voice_to_text.dart';
import 'package:signup/signup.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/signup':
        return MaterialPageRoute(builder: (context) => Signup());
      case '/second':
        return MaterialPageRoute(builder: (context) => Second());
      case '/third':
        if (arg == 'text')
          return MaterialPageRoute(builder: (context) => MyText());
        else if (arg == "image")
          return MaterialPageRoute(builder: (context) => MyImage());
        else if (arg == "voice")
          return MaterialPageRoute(builder: (context) => Myvoice());
    }
  }
}
