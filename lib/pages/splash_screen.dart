import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imageslider/pages/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(Duration(seconds: 5), () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => mainscreen()),
  ));
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[800]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        'image.gif',
                        height: 150,
                        width: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Dog's Path",
                        style: TextStyle(color: Colors.grey[300], fontSize: 20),
                        textScaleFactor: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "by",
                          style:
                              TextStyle(color: Colors.grey[300], fontSize: 10),
                          textScaleFactor: 2,
                        ),
                      ),
                      new Text(
                        "VirtuoStack Software Pvt Ltd",
                        style: TextStyle(color: Colors.grey[300], fontSize: 12),
                        textScaleFactor: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
