import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twibble/Login%20and%20Signup%20Pages/SignUpScreen.dart';
import 'package:twibble/Login%20and%20Signup%20Pages/loginscreen.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 2100),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticIn);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 10, 3, 10),
                  child: Container(
                    child: Image.asset(
                      "assets/images/twibblelogo.png",
                      height: animation.value * 100,
                      width: 100,
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Oswald',
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Twibble",
                          speed: Duration(milliseconds: 350),
                        ),
                      ],
                    ),

                    // style: TextStyle(
                    //     fontSize: 45.0,
                    //     fontWeight: FontWeight.w900,
                    //     color: Colors.black,
                    //     fontFamily: "Oswald"),
                  ),
                ),
              ],
            ),

            //Login Button
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 87.0, vertical: 10.0),
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            //Sign  up button
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
