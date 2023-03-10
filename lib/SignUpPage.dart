import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final validCharacters = RegExp(r'[^A-Za-z]');

  void signUp() async {
    if (username.text.isNotEmpty &&
        mail.text.isNotEmpty &&
        password.text.isNotEmpty) {
      if (!validCharacters.hasMatch(username.text)) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: mail.text, password: password.text);
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                  padding: EdgeInsets.all(1),
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.message.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ],
                  ))));
        }
      } else if (validCharacters.hasMatch(username.text)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
                padding: EdgeInsets.all(1),
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invalid username",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                ))));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.all(1),
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Empty field, please check",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              ))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(""),
            mailRegist(mail),
            userRegist(username),
            passwordRegist(password),
            const SizedBox(
              height: 70,
            ),
            signUpButton(context, username, mail, password)
          ],
        ),
      ),
    ));
  }
}

Padding mailRegist(TextEditingController ctrl) {
  return Padding(
    padding: EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            controller: ctrl,
            decoration: InputDecoration(
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 123, 122, 120)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 183, 176, 176), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              fillColor: const Color.fromARGB(255, 231, 230, 225),
              filled: true,
              hintText: "Mail",
            ))
      ],
    ),
  );
}

Padding userRegist(TextEditingController ctrl) {
  return Padding(
    padding: EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            controller: ctrl,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 183, 176, 176), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              fillColor: const Color.fromARGB(255, 231, 230, 225),
              filled: true,
              hintText: "Username",
            ))
      ],
    ),
  );
}

GestureDetector signUpButton(context, username, mail, password) {
  final validCharacters = RegExp(r'[^A-Za-z]');
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: () async {
          if (username.text.isNotEmpty &&
              mail.text.isNotEmpty &&
              password.text.isNotEmpty) {
            if (!validCharacters.hasMatch(username.text)) {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: mail.text, password: password.text);
              } on FirebaseAuthException catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Container(
                        padding: EdgeInsets.all(1),
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.message.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ))));
              }
            } else if (validCharacters.hasMatch(username.text)) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                      padding: EdgeInsets.all(1),
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Invalid username",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ))));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Container(
                    padding: EdgeInsets.all(1),
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Empty field, please check",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ))));
          }
        },
        child: const Text(
          "Sign up",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Padding passwordRegist(TextEditingController ctrl) {
  return Padding(
    padding: EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            obscureText: true,
            controller: ctrl,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 183, 176, 176), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              fillColor: const Color.fromARGB(255, 231, 230, 225),
              filled: true,
              hintText: "Password",
            ))
      ],
    ),
  );
}
