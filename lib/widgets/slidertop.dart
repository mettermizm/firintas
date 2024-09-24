import 'package:firintas/pages/category.dart';
import 'package:flutter/material.dart';

class SliderTop extends StatelessWidget {
  const SliderTop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> products = [
      {
        'id': '1',
        'name': 'Soğuk Kahveler',
        'price': 299,
        'image': 'assets/images/icelatte.png',
        'description': 'Soğuk Kahve Çeşitlerimiz',
        'rating': 5.0
      },
      {
        'id': '2',
        'name': 'Filtre Kahve',
        'price': 79,
        'image': 'assets/images/filtrekahve.webp',
        'description': 'Özenle seçilmiş taze çekirdeklerden filtre kahve.',
        'rating': 4.5
      },
      {
        'id': '3',
        'name': 'Çay',
        'price': 79,
        'image': 'assets/images/cay1.png',
        'description': 'Doğal bitkilerden hazırlanmış taze çay.',
        'rating': 4.0
      },
      {
        'id': '4',
        'name': 'Burger',
        'price': 79,
        'image': 'assets/images/burger.webp',
        'description': 'Lezzetli soslarla hazırlanmış ızgara burger.',
        'rating': 4.8
      },
      {
        'id': '5',
        'name': 'Pasta',
        'price': 79,
        'image': 'assets/images/pasta1.png',
        'description': 'Taze meyvelerle hazırlanmış nefis pasta.',
        'rating': 4.7
      },
      {
        'id': '6',
        'name': 'Sıcak İçecek',
        'price': 79,
        'image': 'assets/images/sicakicecek.png',
        'description': 'Soğuk havalarda iç ısıtan sıcak içecek.',
        'rating': 4.3
      },
      {
        'id': '6',
        'name': 'Sıcak İçecek',
        'price': 79,
        'image': 'assets/images/sicakicecek.png',
        'description': 'Soğuk havalarda iç ısıtan sıcak içecek.',
        'rating': 4.3
      },
      {
        'id': '6',
        'name': 'Sıcak İçecek',
        'price': 79,
        'image': 'assets/images/sicakicecek.png',
        'description': 'Soğuk havalarda iç ısıtan sıcak içecek.',
        'rating': 4.3
      },
      {
        'id': '6',
        'name': 'Sıcak İçecek',
        'price': 79,
        'image': 'assets/images/sicakicecek.png',
        'description': 'Soğuk havalarda iç ısıtan sıcak içecek.',
        'rating': 4.3
      },
      {
        'id': '7',
        'name': 'Filtre Kahve',
        'price': 79,
        'image': 'assets/images/icelatte.png',
        'description': 'Zengin aromalı, el yapımı filtre kahve.',
        'rating': 4.6
      }
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          height: screenHeight * 0.3,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: screenWidth * 0.40,
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(241, 102, 11, 1),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.5),
                                  offset: const Offset(0, 20),
                                  blurRadius: 20.0,
                                  spreadRadius: -10.0,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: screenHeight * -0.03,
                            left: screenWidth * 0.05,
                            child: Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.13,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(231, 155, 104, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight * -0.06,
                            left: screenWidth * 0.05,
                            child: Container(
                              width: screenWidth * 0.30,
                              height: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    products[index]["image"],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight * 0.15,
                            left: screenWidth * 0.03,
                            child: Text(
                              products[index]["name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          /*
                          Positioned(
                            top: screenHeight * 0.16,
                            left: screenWidth * 0.03,
                            child: Text(
                              "${products[index]["price"].toString()}₺",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          */
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
