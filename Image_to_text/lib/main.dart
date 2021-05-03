import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';

main() async {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = '';
  bool istext = false;
  bool ispicked = false;
  PickedFile _image;
  final picker = ImagePicker();
  final translator = GoogleTranslator();
  String language;
  var translation;
  Map m = {
    'Hindi': 'hi',
    'Sanskrit': 'sa',
    'Italian': 'it',
    'Chinese': 'zh-cn',
    'Portuguese': 'pt',
  };
  List languagesList = ['Hindi', 'Italian', 'Chinese', 'Portuguese'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text Recognition'),
          actions: [
            FlatButton(
              onPressed: scanText,
              child: Text(
                'Scan',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              (_image != null) && (ispicked)
                  ? Image.file(
                      File(_image.path),
                      height: 200,
                      width: 200,
                    )
                  : Container(
                      child: Icon(
                        Icons.image,
                        size: 250,
                      ),
                    ),
              (_text != '') || (istext)
                  ? Text(_text)
                  : Text("Your Text will appear here"),
              DropdownButton(
                hint: Text("Select Language for Translation"),
                value: language,
                onChanged: (value) {
                  setState(() {
                    language = value;
                    //translation = await translator.translate(_text,to:m[language]);
                  });
                },
                items: languagesList.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }

  Future scanText() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        _text += line.text + '\n';
      }
    }
    setState(() {
      if (_text != '') {
        _text = _text;
        istext = true;
      } else {
        _text = 'No text in the image';
        istext = false;
      }
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
        ispicked = true;
      } else {
        print('No image selected');
        _image = null;
        ispicked = false;
        _text = '';
        istext = false;
      }
    });
  }
}
