import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:twibble/bodyPages/ChatSelectionPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  String? phoneNumber;
  bool isSpinning = false;
  final _auth = FirebaseAuth.instance;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/images/twibblelogo.png",
                  height: 100,
                  width: 100,
                ),
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: SizedBox(
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
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Email",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2.0),
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
              ),
              SizedBox(
                height: 5.0,
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
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
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
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                  backgroundColor: Colors.greenAccent,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  setState(() {
                    isSpinning = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null ) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    }
                    setState(() {
                      isSpinning = false;
                    });
                  } catch (e) {
                    var snackBar = SnackBar(
                      content: Text('Something went wrong!'),
                      backgroundColor: Colors.greenAccent,
                      action: SnackBarAction(
                        label: "OKAY",
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      isSpinning = false;
                    });
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.green),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Stay logged in ",style: TextStyle(color: Colors.black,),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
