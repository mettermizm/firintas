import 'package:firintas/model/product_model.dart';
import 'package:firintas/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Hiç ürün bulunamadı.'));
          }

          // Ürünler listesi
          List<ProductModel> products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              ProductModel product = products[index];
              return ListTile(
                title: Text(product.urunAdi),
                subtitle: Text('Fiyat: ${product.fiyat}'),
                trailing: Text('Tarih: ${product.tarih}'),
              );
            },
          );
        },
      ),
    );
  }
}
