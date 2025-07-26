import 'package:flutter/material.dart';
import 'package:ecomm_flutter/model/product.dart';

class Cart extends ChangeNotifier {
  // List of products available (you might not need this if fetched from API)
  List<Product> availableProducts = [];

  // List of items in the user's cart
  final List<Product> _userCart = [];

  // Get cart
  List<Product> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }

  // (Optional) Set available products (if you want to sync API result here)
  void setAvailableProducts(List<Product> products) {
    availableProducts = products;
    notifyListeners();
  }

  // Check if item is already in cart
  bool isInCart(Product product) {
    return _userCart.contains(product);
  }
}
