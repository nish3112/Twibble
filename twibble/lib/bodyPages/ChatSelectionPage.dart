import 'package:flutter/material.dart';

import '../Custom Buttons/fields and buttons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                    child: Text("Twibble"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.login_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.centerRight,
              ),
            ],
          ),
          backgroundColor: Color(0x2A2F32),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
              ChatHomeScreenButton(),
            ],
          ),
        ),
      ),
    );
  }
}
