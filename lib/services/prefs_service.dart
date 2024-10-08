import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static Future<List<String>> getCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    return cart;
  }
}
