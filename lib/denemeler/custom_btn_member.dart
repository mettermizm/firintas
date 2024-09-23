import 'package:flutter/material.dart';

class CustomBtnMember {
  static Widget customBtnMember({
    required Color color,
    required VoidCallback onTap,
    required String labelText,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: labelText == "Google ile Giriş" ? null : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              color: labelText == "Google ile Giriş"
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: Container(
                width: 30,
                alignment: Alignment.centerLeft,
                child: Icon(icon,
                    color: labelText == "Google ile Giriş"
                        ? Colors.black
                        : Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                labelText,
                style: TextStyle(
                  color: labelText == "Google ile Giriş"
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
