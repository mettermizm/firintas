import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/widgets/slidertop.dart';
import 'package:firintas/pages/qrcode_scaner.dart';
import 'package:flutter/material.dart';

class QrConsoleRead extends StatefulWidget {
  const QrConsoleRead({super.key});

  @override
  State<QrConsoleRead> createState() => _QrConsoleReadState();
}

class _QrConsoleReadState extends State<QrConsoleRead> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Burger',
        'price': '299₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
      {
        'name': 'Filtre Kahve',
        'price': '79₺',
        'image': 'assets/images/icelatte.png'
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mehmet'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  hintText: "Ara",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: 40,
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 15.0),
                  filled: true,
                  fillColor: const Color.fromRGBO(250, 250, 250, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (String value) {
                  print(
                      'Kullanıcı "OK" butonuna bastı ve girilen değer: $value');
                },
              ),
            ),
            const SliderTop(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBtn.customBtn(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRViewPage()));
                }, context, MediaQuery.sizeOf(context).width / 2 - 30,
                    "QR Kod Okut"),
                const SizedBox(
                  width: 30,
                ),
                CustomBtn.customBtn(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRViewPage()));
                }, context, MediaQuery.sizeOf(context).width / 2 - 30,
                    "Şubelerimiz"),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Text(
                      "Sevilen Ürünlerimiz",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      "Daha Fazla",
                      style: TextStyle(
                        color: Color.fromRGBO(241, 103, 16, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildPopularProduct(product['name']!, product['price']!,
                    product['image']!, context);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(241, 102, 11, 1),
              ),
              child: Text(
                'Menü Başlığı',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Anasayfa'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopularProduct(
    String name, String price, String imagePath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      CustomDialog.showCustomDialog(
          context: context, title: "dskolf", content: "lkfd");
    },
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(231, 155, 105, 1),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Image.asset(imagePath, height: 80),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '5.0',
                      style: TextStyle(
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
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Burger',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '299₺',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
