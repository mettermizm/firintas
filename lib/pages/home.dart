import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/pages/sepet_page.dart';
import 'package:firintas/services/prefs_service.dart';
import 'package:firintas/widgets/product_list_widget.dart';
import 'package:firintas/widgets/slidertop.dart';
import 'package:firintas/model/product_model.dart';
import 'package:firintas/pages/qrcode_scaner.dart';
import 'package:firintas/pages/subeler.dart';
import 'package:firintas/services/product_service.dart';
import 'package:firintas/widgets/loadingscreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int cartItemCount = 0;

    Future<void> loadCartItemCount() async {
      List<String> items = await CartService.getCartItems();
      setState(() {
        cartItemCount = items.length;
      });
    }

    @override
    void initState() {
      super.initState();
      loadCartItemCount();
    }

    /*
    final List<Map<String, dynamic>> products = [
      {
        'id': '1',
        'name': 'Ice Latte',
        'price': 299,
        'image': 'assets/images/icelatte.png',
        'description': 'Buz gibi taze süt ile hazırlanmış Ice Latte.',
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
        'id': '7',
        'name': 'Filtre Kahve',
        'price': 79,
        'image': 'assets/images/icelatte.png',
        'description': 'Zengin aromalı, el yapımı filtre kahve.',
        'rating': 4.6
      }
    ];
*/
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Mehmet'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SepetPage()),
              );
            },
          ),
          if (cartItemCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Text(
                  cartItemCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
                  //print('Kullanıcı "OK" butonuna bastı ve girilen değer: $value');
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
                          builder: (context) => const Subelerimiz()));
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
            FutureBuilder<List<ProductModel>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingScreen());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Hiç ürün bulunamadı.'));
                }
                List<ProductModel> products = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    ProductModel product = products[index];
                    return ProductListWidget.buildPopularProduct(
                        context, product);
                  },
                );
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(ImageConstanst.logo),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Anasayfa'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Kişisel Ayarlar'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.point_of_sale),
                title: const Text('İndirimler'),
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
      ),
    );
  }
}
