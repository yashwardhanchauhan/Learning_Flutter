import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:translator/translator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage = File("");
  final translator = GoogleTranslator();
  var text = '';
  String translatedText;
  bool imageLoaded = false;
 
  bool hasData;
  

  Future pickImage(ImageSource imageSource) async {
    var awaitImage = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
    });

    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);
    for (TextBlock block in visionText.blocks) {
      text = '';
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            text = text + word.text + ' ';
          });
        }
        text = text + '\n';
      }
    }
    textRecognizer.close();

    print("Translate Images");
    // getHttp(text: text);
    await translator.translate(text, to: 'es').then((value) {
      setState(() {
        translatedText = value.text;
        hasData = true;
      });
    });
    print("Translated Images");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    hasData = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          imageLoaded
              ? Center(
                  child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 20),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  height: 250,
                  width: 250,
                  child: Image.file(
                    pickedImage,
                    fit: BoxFit.cover,
                  ),
                ))
              : Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 20),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
  
                  child: Icon(Icons.image,size: 200,)
            
                  ,),
          SizedBox(height: 10.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  icon: Icon(
                    Icons.photo_camera,
                    size: 100,
                  ),
                  label: Text(''),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    pickImage(ImageSource.camera);
                  },
                ),
                FlatButton.icon(
                  icon: Icon(
                    Icons.photo,
                    size: 100,
                  ),
                  label: Text(''),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 10.0,
            color: Colors.red,
          ),
          text == ''
              ? Text('Text will display here')
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    text,
                  ),
                ),
          Container(
            height: 10.0,
            color: Colors.red,
          ),
          hasData
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      // translateRes.data.translations[0].translatedText,
                      translatedText),
                )
              : Text('Text will display here'),
        ],
      ),
    );
  }
}