
import 'package:fitneess/home_screen.dart';
import 'package:fitneess/onboard.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      home: onboard(),
      routes: {
        "/home_screen": (context) => homePage(),
   
      },
    );
  }
}