import 'dart:convert';
import 'package:firintas/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String url = "https://karenbilisim.com/demo2/firintas/api1/get_product";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Veri getirilemedi!');
    }
  }
}
