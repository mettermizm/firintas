import 'package:flutter/material.dart';

class CustomDialog {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    String buttonText = "Tamam",
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
            ),
          ],
        );
      },
    );
  }
}
