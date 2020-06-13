import "package:flutter/material.dart";
import "package:flutter_signin_button/flutter_signin_button.dart";
import 'package:shoutout/google_auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        actions: <Widget>[
          
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange , Colors.red])),
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/Super_Megaphone_9.png"),
              SizedBox(height: 10),
              Text(
                "megaphone",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w100, fontFamily: 'Oxygen'),
              
              ),
              SizedBox(height: 40),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  signInWithGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
