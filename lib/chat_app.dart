// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'Chat_Cards.dart';
import 'chat_slide.dart';
import 'login.dart';

class ChatApp extends StatelessWidget {
  final TextEditingController ctrl;

  const ChatApp({Key? key, required this.ctrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
          ),
          title: Text(
            ctrl.text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
              color: Colors.white,
            ),
            PopupMenuButton(
              onSelected: (value) => {
                if (value == 1)
                  {
                    FirebaseAuth.instance.signOut()
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => LoginScreen()))
                  }
              },
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("Settings")),
                PopupMenuItem(
                  value: 1,
                  child: Text("Log Out"),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chatsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatSlide(chat: chatsData[index]);
                },
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey[600]),
            Expanded(
              child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatCard(chat: chatsData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
