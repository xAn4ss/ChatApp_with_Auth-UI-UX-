// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'chat.dart';
import 'package:chat_app/Chat_Cards.dart';
import 'chat_slide.dart';

class ChatApp extends StatefulWidget {
  ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
          ),
          title: Text(
            "Anas",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
              color: Colors.black,
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
