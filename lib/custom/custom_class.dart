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

class CustomTextField {
  static Widget customTextField({
    required TextEditingController controller,
    required String label,
    required Icon icon,
    bool? obscure,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 241, 102, 9),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        suffixIcon: icon,
      ),
      obscureText: obscure ?? false,
      style: const TextStyle(
        color: Color.fromARGB(255, 34, 34, 34),
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Color.fromARGB(255, 9, 102, 241),
    );
  }
}
