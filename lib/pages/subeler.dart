import 'package:firintas/constanst/color_constanst.dart';
import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/model/sube_model.dart';
import 'package:flutter/material.dart';

class Subelerimiz extends StatefulWidget {
  const Subelerimiz({super.key});

  @override
  State<Subelerimiz> createState() => _SubelerimizState();
}

class _SubelerimizState extends State<Subelerimiz> {
  final List<Map<String, String>> subeler = [
    {
      "isim": "ADNAN MENDERES BÜFEMİZ",
      "adres": "Adres 1, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "HASAN BASRİ ÇANTAY BÜFEMİZ",
      "adres": "Adres 2, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.8"
    },
    {
      "isim": "SAVAŞTEPE CADDESİ BÜFEMİZ",
      "adres": "Adres 3, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.5"
    },
    {
      "isim": "KURTDERELİ BÜFEMİZ",
      "adres": "Adres 4, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.2"
    },
    {
      "isim": "ALİ HİKMET PAŞA İ.Ö.O. BÜFEMİZ",
      "adres": "Adres 5, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.1"
    },
    {
      "isim": "CENGİZ TOPEL BÜFEMİZ",
      "adres": "Adres 6, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.9"
    },
    {
      "isim": "ALTINTAŞLAR BÜFEMİZ",
      "adres": "Adres 7, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.3"
    },
    {
      "isim": "CENGİZ TOPEL 2 BÜFEMİZ",
      "adres": "Adres 8, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.8"
    },
    {
      "isim": "ÇARDAKLI BÜFEMİZ",
      "adres": "Adres 9, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.7"
    },
    {
      "isim": "ÇARŞAMBA PAZARI BÜFEMİZ",
      "adres": "Adres 10, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "ÇEVRE YOLU BÜFEMİZ",
      "adres": "Adres 11, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.1"
    },
    {
      "isim": "DEVE LONCASI BÜFEMİZ",
      "adres": "Adres 12, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "DEVLET HASTANESİ BÜFEMİZ",
      "adres": "Adres 13, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.2"
    },
    {
      "isim": "DİŞ HASTANESİ BÜFEMİZ",
      "adres": "Adres 14, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.9"
    },
    {
      "isim": "GÜNDOĞAN BÜFEMİZ",
      "adres": "Adres 15, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.3"
    },
    {
      "isim": "KARATEPE BÜFEMİZ",
      "adres": "Adres 16, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "KARESİ AVM BÜFEMİZ",
      "adres": "Adres 17, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.5"
    },
    {
      "isim": "KARİZMA BÜFEMİZ",
      "adres": "Adres 18, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.2"
    },
    {
      "isim": "KÖPRÜBAŞI BÜFEMİZ",
      "adres": "Adres 19, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.7"
    },
    {
      "isim": "KÖYLÜ GARAJI BÜFEMİZ",
      "adres": "Adres 20, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.1"
    },
    {
      "isim": "KUVAY-İ MİLLİYE 2. BÜFEMİZ",
      "adres": "Adres 21, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "KUVAY-İ MİLLİYE BÜFEMİZ",
      "adres": "Adres 22, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.2"
    },
    {
      "isim": "MALTEPE BÜFEMİZ",
      "adres": "Adres 23, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.9"
    },
    {
      "isim": "NEF BÜFEMİZ",
      "adres": "Adres 24, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.3"
    },
    {
      "isim": "PLEVNE BÜFEMİZ",
      "adres": "Adres 25, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.0"
    },
    {
      "isim": "SAKARYA BÜFEMİZ",
      "adres": "Adres 26, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.8"
    },
    {
      "isim": "TOKİ BÜFELERİMİZ",
      "adres": "Adres 27, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.5"
    },
    {
      "isim": "SEVGİ HASTANESİ BÜFEMİZ",
      "adres": "Adres 28, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.1"
    },
    {
      "isim": "TOYGAR BÜFEMİZ",
      "adres": "Adres 29, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "7.9"
    },
    {
      "isim": "ZAFER İLKÖĞRETİM OKULU BÜFEMİZ",
      "adres": "Adres 30, Şehir",
      "gorsel": ImageConstanst.firintasBufe,
      "puan": "8.2"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<SubeModel> subeModelListesi =
        subeler.map((subeMap) => SubeModel.fromMap(subeMap)).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Şubelerimiz'),
      ),
      body: ListView.builder(
        itemCount: subeModelListesi.length,
        itemBuilder: (context, index) {
          final sube = subeModelListesi[index];
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
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        sube.gorsel,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sube.isim,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            sube.adres,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                sube.puan,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  double puan = double.parse(sube.puan);
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
  final SubeModel sube;

  const SubeDetayPage({super.key, required this.sube});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(sube.isim),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sube.gorsel,
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              sube.isim,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              sube.adres,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
