import 'package:flutter/material.dart';

class CustomText {
  static Text customOrangeText(
      String text, double fontSize, String? fontFamily) {
    return Text(
      text,
      style: TextStyle(
        color: const Color.fromARGB(255, 235, 102, 6),
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
