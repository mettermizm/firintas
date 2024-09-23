import 'package:firintas/constanst/color_constanst.dart';
import 'package:flutter/material.dart';

class Subelerimiz extends StatefulWidget {
  const Subelerimiz({super.key});

  @override
  State<Subelerimiz> createState() => _SubelerimizState();
}

class _SubelerimizState extends State<Subelerimiz> {
  final List<Map<String, String>> subeler = [
    {
      "isim": "Restoran A",
      "adres": "Adres 1, Şehir",
      "gorsel": "assets/images/firintaslogo.png",
      "puan": "8.0"
    },
    {
      "isim": "Restoran B",
      "adres": "Adres 2, Şehir",
      "gorsel": "assets/images/firintaslogo.png",
      "puan": "9.0"
    },
    {
      "isim": "Restoran C",
      "adres": "Adres 3, Şehir",
      "gorsel": "assets/images/firintaslogo.png",
      "puan": "7.5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şubelerimiz'),
      ),
      body: ListView.builder(
        itemCount: subeler.length,
        itemBuilder: (context, index) {
          final sube = subeler[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubeDetayPage(sube: sube),
                ),
              );
            },
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    // Şube görseli
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Kenarları yuvarla
                      child: Image.asset(
                        sube["gorsel"]!,
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                        width: 16), // Görsel ile metin arasında boşluk
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Şube ismi
                          Text(
                            sube["isim"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Şube adresi
                          Text(
                            sube["adres"]!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Puan ve yıldızlı değerlendirme
                          Row(
                            children: [
                              Text(
                                sube["puan"]!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              // Yıldızlar
                              Row(
                                children: List.generate(5, (starIndex) {
                                  double puan = double.parse(sube["puan"]!);
                                  return Icon(
                                    starIndex < puan / 2
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SubeDetayPage extends StatelessWidget {
  final Map<String, String> sube;

  const SubeDetayPage({super.key, required this.sube});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sube["isim"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sube["gorsel"]!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              sube["isim"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              sube["adres"]!,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
