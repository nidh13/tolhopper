import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataDataSource {
  Future<String?> getCart();
  Future<void> saveCart(String cart);
  Future<void> removeCart();
}

class CartLocalDataDataSourceImpl extends CartLocalDataDataSource {
  final SharedPreferences sharedPreferences;
  static const String _cartKey = 'cart';

  CartLocalDataDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String?> getCart() async {
    return sharedPreferences.getString(_cartKey);
  }

  @override
  Future<void> removeCart() async {
    await sharedPreferences.remove(_cartKey);
  }

  @override
  Future<void> saveCart(String cart) async {
    await sharedPreferences.setString(_cartKey, cart);
  }
}
