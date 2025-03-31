// ignore_for_file: unused_local_variable, use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/main.dart';
import 'package:firebase_tutorial/uihelper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomAlertBox(context, "Fill the required fields.");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: "Home Page")));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              emailController, "Enter your email", Icons.mail_outline, false),
          UiHelper.CustomTextField(
              passwordController, "Enter your password", Icons.password, true),
          SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton(() {
            signUp(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
          }, "Sign Up")
        ],
      ),
    );
  }
}
