import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListWidget {
  static Widget buildPopularProduct(
      BuildContext context, ProductModel productList) {
    Future<void> addToCart(String productId) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> cart = prefs.getStringList('cart') ?? [];

      cart.add(productId);

      await prefs.setStringList('cart', cart);

      print("Ürün sepete eklendi: $productId");
    }

    Future<void> addToCart22() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> cart = prefs.getStringList('cart') ?? [];

      cart.add("productId");

      await prefs.setStringList('cart', cart);

      print("Ürün sepete eklendi: productId");
    }

    return GestureDetector(
      onTap: () {
        CustomSepetDialog.showProductDialog(
          context: context,
          productId: productList.id,
          productName: productList.urunAdi,
          productDescription: productList.aciklama,
          productImageUrl: "assets/images/cay1.png",
          onTap: addToCart22(), //addToCart(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(231, 155, 105, 1),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/cay1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Ürün rating
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        productList.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Ürün bilgileri
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ürün adı
                  Text(
                    productList.urunAdi,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Ürün fiyatı
                  Text(
                    "${productList.fiyat.toString()}₺",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    productList.aciklama,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
