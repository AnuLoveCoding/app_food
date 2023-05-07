import 'package:flutter/material.dart';
class MyTextFeild extends StatelessWidget {
    final String hintText;
    final bool obscureText;
     final TextEditingController controller;

    MyTextFeild({required this.hintText, required  this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

