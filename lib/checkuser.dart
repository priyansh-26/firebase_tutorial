import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/loginpage.dart';
import 'package:firebase_tutorial/main.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }

  checkuser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MyHomePage(title: "Home Screen");
    } else {
      return LoginPage();
    }
  }
}
