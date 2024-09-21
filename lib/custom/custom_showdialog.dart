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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(241, 102, 11, 1), // Primary color
            ),
          ),
          content: Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color:
                  Colors.black87, // Slightly darker text color for readability
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(
                    241, 102, 11, 1), // Button background with primary color
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 24), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded button
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for contrast
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
