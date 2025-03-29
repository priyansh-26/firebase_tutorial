// ignore_for_file: use_build_context_synchronously, unused_local_variable, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/main.dart';
import 'package:firebase_tutorial/signuppage.dart';
import 'package:firebase_tutorial/uihelper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.CustomAlertBox(context, "Fill required fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
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
        title: Text("Login Page"),
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
            login(emailController.text.toString(),
                passwordController.text.toString());
          }, "Login"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
