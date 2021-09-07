import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:twibble/Login%20and%20Signup%20Pages/loginscreen.dart';

import '../Custom Buttons/fields and buttons.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? name;
  String? email;
  String? password;
  String? verifypassword;
  String? phoneNumber;
  bool isSpinning = false;
  final _auth = FirebaseAuth.instance;
  bool correctpassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/images/twibblelogo.png",
                  height: 100,
                  width: 100,
                ),
                padding: EdgeInsets.all(20),
              ),
              CustomTextField(
                inputText: "Name",
                textObscure: false,
              ),
              SizedBox(
                height: 48.0,
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      email = value;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: "Email",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: "Password",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      verifypassword = value;
                      if (password == verifypassword) correctpassword = true;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: "Verify Password",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () async {
                  if (correctpassword == true) {
                    setState(() {
                      isSpinning = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );

                      setState(() {
                        isSpinning = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    var snackBar = SnackBar(
                      content: Text('Please verify your password'),
                      backgroundColor: Colors.greenAccent,
                      action: SnackBarAction(
                        label: "OKAY",
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
