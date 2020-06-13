import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:shoutout/auth.dart';
import 'dart:collection';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _TopicRouteState extends State<TopicRoute> {
  Map topics = {
    "World News": false,
    "Politics": false,
    "Gaming": false,
    "Television": false,
    "Music": false,
    "Art": false,
    "Finance": false,
  };
  List topic_names = ["World News", "Politics", "Gaming", "Television", "Music", "Art", "Finance"];
  Map topic_icons= {
    "World News": Icons.public,
    "Politics": Icons.face,
    "Gaming": Icons.gamepad,
    "Television": Icons.tv,
    "Music": Icons.music_note,
    "Art": Icons.palette,
    "Finance": Icons.monetization_on,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Topic Selection"),
          backgroundColor: Colors.orange,
          elevation: 0.0,
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(40),
            separatorBuilder: (content, index) => Divider(
              color: Colors.white,
            ),
          itemCount: 7,
          itemBuilder: (content, index) => Padding(
            padding: EdgeInsets.all(2),
            child : Material(
              elevation: topics[topic_names[index]] ? 0 : 2.0,
              color: topics[topic_names[index]] ? Colors.grey : Colors.white,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics[topic_names[index]] = !topics[topic_names[index]]);
                  print(topic_names[index]);
                  print(topics[topic_names[index]]);
                  print(topics);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        topic_icons[topic_names[index]],
                        size: 30,
                      ),
                      Spacer(),
                      Text(topic_names[index],
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
          ),
          );
  }
}
/*
    
          children: <Widget>[
            // World News
            Material(
              elevation: topics["World News"] ? 2.0 : 0,
              color: topics["World News"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["World News"] = !topics["World News"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.public,
                        size: 30,
                      ),
                      Spacer(),
                      Text("World News",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Politics
            Material(
              elevation: topics["Politics"] ? 2.0 : 0,
              color: topics["Politics"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Politics"] = !topics["Politics"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.question_answer,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Politics",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Finance
            Material(
              elevation: topics["Finance"] ? 2.0 : 0,
              color: topics["Finance"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Finance"] = !topics["Finance"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Finance",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Music
            Material(
              elevation: topics["Music"] ? 2.0 : 0,
              color: topics["Music"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Music"] = !topics["Music"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.music_note,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Music",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Art
            Material(
              elevation: topics["Art"] ? 2.0 : 0,
              color: topics["Art"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Art"] = !topics["Art"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Art",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Television
            Material(
              elevation: topics["Television"] ? 2.0 : 0,
              color: topics["Television"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Television"] = !topics["Television"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.tv,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Television",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
            // Gaming
            Material(
              elevation: topics["Gaming"] ? 2.0 : 0,
              color: topics["Gaming"] ? Colors.white : Colors.grey,
              child: InkWell(
                focusColor: Colors.white,
                splashColor: Colors.blue,
                onTap: () {
                  setState(() => topics["Gaming"] = !topics["Gaming"]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.videogame_asset,
                        size: 30,
                      ),
                      Spacer(),
                      Text("Gaming",
                          style: TextStyle(fontFamily: 'Oxygen', fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),

          ],
        ));*/
class TopicRoute extends StatefulWidget {
  @override
  _TopicRouteState createState() => _TopicRouteState();
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
          //title: const Text('megaphone'),
          backgroundColor: Colors.orange,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                "LOGOUT",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _auth.signout();
              },
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange, Colors.red])),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80),

                  Text("WELCOME TO MEGAPHONE",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.w100,
                          fontSize: 40)),
                  SizedBox(height: 40),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("How it works: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Oxygen',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              "Select the topics you want to stay up-to-date on and you'll on what's trending!",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Oxygen'))
                        ],
                      )),
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text('Select Topic',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TopicRoute()),
                      );
                    },
                  ),
                  //Image.asset('assets/images/Super_Megaphone_9.png'),
                  Spacer(),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            )));
  }
}
