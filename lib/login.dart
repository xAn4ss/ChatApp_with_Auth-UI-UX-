import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_app.dart';
import 'SignUpPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mail = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future signIn(mail, pssword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail.text, password: pssword.text);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: EdgeInsets.all(15),
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
              )));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatApp(ctrl: mail);
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 75),
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 35),
                    child: Text("LOGO",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                  ),
                  mailField(ctrl: mail),
                  passwordField(password),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forgot password ?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SignInButton(mail, password),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    " Not a member ?",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color.fromARGB(255, 176, 22, 22);
                        return Colors
                            .black; // null throus error in flutter 2.2+.
                      }),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Text('Sign Up',
                        style: TextStyle(
                            wordSpacing: 2,
                            decoration: TextDecoration.underline)),
                  )
                ],
              ),
            );
          }
        },
      ),
      // backgroundColor: Colors.red,
    );
  }

  GestureDetector SignInButton(mail, pass) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        child: TextButton(
          onPressed: () {
            if (mail.text.isNotEmpty && pass.text.isNotEmpty) {
              signIn(mail, pass);
            } else {
              final snackBar = SnackBar(content: Text("Type your username"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Text(
            "Sign in",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Padding passwordField(password) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: TextField(
          onTap: () {},
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.star),
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
          ),
        ));
  }
}

class mailField extends StatelessWidget {
  const mailField({
    super.key,
    required this.ctrl,
  });

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: TextField(
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
            )));
  }
}
