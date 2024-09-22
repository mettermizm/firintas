import 'package:flutter/material.dart';

class SliderTop extends StatelessWidget {
  const SliderTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          height: 230,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: SizedBox(
                    width: 160,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 102, 11, 1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                offset: const Offset(-10, 10),
                                blurRadius: 40.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: 20,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(231, 155, 104, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -50,
                          left: 25,
                          child: Container(
                            width: 100,
                            height: 100,
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
                          top: 95,
                          left: 15,
                          child: Container(
                            child: Text(
                              "Iced Latte",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          left: 15,
                          child: Container(
                            child: Text(
                              "₺ 120",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
