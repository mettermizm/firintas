import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            borderRadius: BorderRadius.circular(20),
          ),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:
                  Text(buttonText, style: const TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class CustomSepetDialog {
  static Future<void> showProductDialog({
    required BuildContext context,
    required String productName,
    required String productDescription,
    required String productImageUrl,
    String addToCartButtonText = "Sepete Ekle",
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            productName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(productImageUrl), // Ürün görseli
              const SizedBox(height: 10),
              Text(productDescription), // Ürün açıklaması
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                // Sepete ekle işlemi
                await addToCart(
                    productName, productDescription, productImageUrl);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                addToCartButtonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> addToCart(
      String name, String description, String imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cart = prefs.getStringList('cart') ?? [];

    // Ürünün JSON formatında bir String olarak kaydedilmesi
    cart.add('$name|$description|$imageUrl');

    // Güncellenmiş sepeti kaydet
    await prefs.setStringList('cart', cart);

    print("Ürün sepete eklendi: $name");
  }
}
