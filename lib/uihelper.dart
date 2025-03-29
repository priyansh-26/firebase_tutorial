// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  static CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[300]),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}
