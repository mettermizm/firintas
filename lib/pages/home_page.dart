import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mehmet'),
        leading: Container(),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Arama Çubuğu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ara',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            // Slider - Ürünler
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard('Iced Latte', '120₺', '100₺',
                      'assets/images/icedlatte.png'),
                  _buildProductCard(
                      'Köfte', '300₺', '', 'assets/images/kofte.png'),
                ],
              ),
            ),

            // QR Kod ve Şube Butonları
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton('QR Kod Okut'),
                  _buildActionButton('Şubelerimiz'),
                ],
              ),
            ),

            // Sevilen Ürünler Bölümü
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sevilen Ürünlerimiz',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Daha Fazla',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),

            // Ürün Listesi
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPopularProduct(
                    'Burger', '299₺', 'assets/images/icedlatte.png'),
                _buildPopularProduct(
                    'Filtre Kahve', '79₺', 'assets/images/kofte.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Ürün kartı (Slider için)
  Widget _buildProductCard(
      String name, String price, String oldPrice, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 102, 6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 80),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            if (oldPrice.isNotEmpty)
              Text(
                oldPrice,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Sevilen Ürünler Bölümündeki Ürün Kartı
  Widget _buildPopularProduct(String name, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(imagePath, height: 80),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 16),
              ),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text('5.0'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Buton (QR Kod, Şubeler için)
  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 2,
      ),
      child: Text(label),
    );
  }
}
