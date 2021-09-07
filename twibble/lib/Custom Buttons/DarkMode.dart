import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

class DarkMode extends StatefulWidget {
  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  String bACKgroundcolor = "Colors.white";
  String textFieldBorder = "Colors.blueGrey";
  String textColor = "Colors.black";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SwitcherButton(
          onChange: (value) {
            setState(() {
              bACKgroundcolor = "Color(0x2A2F32)";
              textFieldBorder = "Colors.white";
              textColor= "Colors.white";
            });
          },
        ),
      ),
    );
  }
}
