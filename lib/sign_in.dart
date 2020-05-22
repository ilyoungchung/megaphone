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
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            label: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              SignInButton(
                Buttons.GoogleDark,
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
