import 'package:flutter/material.dart';
import 'package:twibble/bodyPages/chatscreen.dart';

class CustomTextField extends StatelessWidget {
  String? inputText;
  bool textObscure = false;
  String? value1;

  CustomTextField({
    @required this.inputText,
    required this.textObscure,
    //we used value1 and not this.value 1   --- check this
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48.0,
        width: 300.0,
        child: Padding(
          padding: EdgeInsets.all(3),
          child: TextField(
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.next,
            onChanged: (value) {},
            obscureText: textObscure,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              hintText: "$inputText",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purpleAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatHomeScreenButton extends StatelessWidget {
  const ChatHomeScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/userprofile.jpg"),
              radius: 30.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  RichText(
                    text: TextSpan(
                      text: "Username",
                      style: TextStyle(fontSize: 17.5),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width /2.5,),
                  Text(
                    "4:33am",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              RichText(
                text: TextSpan(
                  text: "Message received",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
