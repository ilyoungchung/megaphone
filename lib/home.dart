import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shoutout/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  final AuthService _auth = AuthService();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
       setState(() {
        _messageText = "$message";
       });
        print("onMessage: $message");
      },

      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
        _messageText = "$message";
         });
        print("onLaunch: $message");
      },

      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "$message";
        });
        print("onResume: $message");
      },
    );
    
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((token) {
      print("FCM Token: $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Push Messaging Demo'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _auth.signout();
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Check your notifications!",
        style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
