// @dart=2.9
import 'package:flutter/material.dart';
import 'package:twibble/Login%20and%20Signup%20Pages/LoginSignup.dart';
import 'package:twibble/Login%20and%20Signup%20Pages/loginscreen.dart';

void main() {
  runApp(Twibble());
}

class Twibble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme( bodyText1 :TextStyle(color: Color(0xAA090b17),),
        ),
      ),
      home: homePage(),
    );
  }
}
