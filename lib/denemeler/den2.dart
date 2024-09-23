import 'package:flutter/material.dart';

class SliderTop extends StatelessWidget {
  const SliderTop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          height: screenHeight * 0.3,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
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
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/icelatte.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.13,
                          left: screenWidth * 0.03,
                          child: const Text(
                            "Iced Latte",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.16,
                          left: screenWidth * 0.03,
                          child: const Text(
                            "₺ 120",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
