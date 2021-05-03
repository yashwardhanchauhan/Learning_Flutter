import 'package:flutter/material.dart';
import 'package:signup/authentication.dart';


class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Option below"),
        backgroundColor: Colors.black,
        actions: [
         IconButton(icon: Icon(Icons.logout,), onPressed: ()=>signOutUser().whenComplete(() => Navigator.of(context).pushReplacementNamed("/"))) 
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: MyRadioWidget(),
      ),
    );
  }
}

var options = ['text', 'image', 'voice'];

class MyRadioWidget extends StatefulWidget {
  @override
  _MyRadioWidgetState createState() => _MyRadioWidgetState();
}

class _MyRadioWidgetState extends State<MyRadioWidget> {
  var _site = options[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child:Text("Translation Type",style: TextStyle(fontSize:30,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white),),
          margin: EdgeInsets.all(10),
          color: Colors.black,
  
          
        ),
        SizedBox(height: 40,),
        ListTile(
          title: const Text('Translate into Text',
              style: TextStyle(fontSize: 15.0)),
          leading: Radio(
            value: options[0],
            groupValue: _site,
            onChanged: (var value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Translate into Text from image',
              style: TextStyle(fontSize: 20.0)),
          leading: Radio(
            value: options[1],
            groupValue: _site,
            onChanged: (var value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Translate into Voice',
              style: TextStyle(fontSize: 20.0)),
          leading: Radio(
            value: options[2],
            groupValue: _site,
            onChanged: (var value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(25),
          child: FlatButton(
            child: Text(
              'NEXT',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed("/third", arguments: _site);
            },
          ),
        ),
      ],
    );
  }
}
