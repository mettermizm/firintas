import 'package:firintas/constanst/image_constanst.dart';
import 'package:flutter/material.dart';

class SepetPage extends StatefulWidget {
  const SepetPage({super.key});

  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  int icedLatteCount = 2;
  int cheesecakeCount = 1;
  int totalPrice = 350;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(247, 247, 247, 1),
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text(
          'Sepet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        /*
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        */
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Iced Latte Row
            buildCartItem(
              'Iced Latte',
              '120₺',
              ImageConstanst.logo,
              icedLatteCount,
              onDecrement: () {
                setState(() {
                  if (icedLatteCount > 0) icedLatteCount--;
                  updateTotalPrice();
                });
              },
              onIncrement: () {
                setState(() {
                  icedLatteCount++;
                  updateTotalPrice();
                });
              },
            ),
            const SizedBox(height: 16),
            // Cheesecake Row
            buildCartItem(
              'Frambuaz Cheesecake',
              '110₺',
              ImageConstanst.logo,
              cheesecakeCount,
              onDecrement: () {
                setState(() {
                  if (cheesecakeCount > 0) cheesecakeCount--;
                  updateTotalPrice();
                });
              },
              onIncrement: () {
                setState(() {
                  cheesecakeCount++;
                  updateTotalPrice();
                });
              },
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Toplam',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  '$totalPrice₺',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Apply coupon logic
              },
              child: const Text(
                'İndirim Kuponu Kullanın',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Payment Method Section
            const Text(
              'Ödeme Yöntemi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MEHMETİN_KARTI',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '**** 1234',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$totalPrice₺',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCartItem(
      String title, String price, String imagePath, int quantity,
      {required Function onDecrement, required Function onIncrement}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => onDecrement(),
              icon: const Icon(Icons.remove),
              color: Colors.orange,
            ),
            Text(
              quantity.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => onIncrement(),
              icon: const Icon(Icons.add),
              color: Colors.orange,
            ),
          ],
        ),
      ],
    );
  }

  void updateTotalPrice() {
    totalPrice = (icedLatteCount * 120) + (cheesecakeCount * 110);
  }
}
