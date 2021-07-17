import 'package:flutter/material.dart';
import 'package:imageslider/pages/splash_screen.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.grey, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));
