import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:signup/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:signup/authentication.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: "Translator",
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    onGenerateRoute: RouteGen.generateRoute,
  ));
}

class MyApp extends StatelessWidget {
  String email;
  String password;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  // void login() {
  //   if (formkey.currentState.validate()) {
  //     formkey.currentState.save();
  //     signin(email, password, context).then((value) {
  //       if (value != null) {
  //         Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => TasksPage(uid: value.uid),
  //             ));
  //       }
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Translator")),backgroundColor: Colors.teal,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Sign-in Here",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),

            Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "This Field Is Required"),
                          EmailValidator(errorText: "Invalid Email Address"),
                        ]),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Password Is Required"),
                            MinLengthValidator(6,
                                errorText: "Minimum 6 Characters Required"),
                          ]),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                      RaisedButton(
                    
                        onPressed:()=> signin(email,password,context).whenComplete(() =>Navigator.of(context).pushReplacementNamed("/second"),),
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SignInButton(Buttons.Google,
            onPressed: ()=>googleSignIn().whenComplete(()=>Navigator.of(context).pushReplacementNamed("/second")),),
            TextButton(onPressed:()=>Navigator.of(context).pushNamed("/signup"), child:Text("New User ? Sign up here..",style: TextStyle(color: Colors.teal),))
               
          ],
        ),
      ),
    );
  }
}
