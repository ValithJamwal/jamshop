// lib/cart_provider.dart
import 'package:flutter/material.dart';
import '../model/card_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    // Check if the item is already in the cart
    CartItem? existingItem; // Declare a nullable CartItem variable
    for (var cartItem in _cartItems) {
      if (cartItem.name == item.name) {
        existingItem = cartItem; // Assign existing item
        break; // Exit the loop if found
      }
    }

    if (existingItem != null) {
      // Increase quantity
      existingItem.quantity++;
    } else {
      // Add new item
      _cartItems.add(CartItem(
        name: item.name,
        price: item.price,
        imageAsset: item.imageAsset,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(String itemName) {
    _cartItems.removeWhere((item) => item.name == itemName);
    notifyListeners();
  }

  void incrementQuantity(String itemName) {
    final item = _cartItems.firstWhere((item) => item.name == itemName);
    if (item != null) {
      item.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String itemName) {
    final item = _cartItems.firstWhere((item) => item.name == itemName);
    if (item != null) {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        removeFromCart(itemName);
      }
      notifyListeners();
    }
  }
}
