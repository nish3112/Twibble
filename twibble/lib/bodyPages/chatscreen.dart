import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.0,
        titleSpacing: 0.0,
        title: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/userprofile.jpg"),
                  radius: 25.0,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Username",
                style: TextStyle(fontSize: 17.5),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 37.5,
                      width: 37.5,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.green[700],
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
