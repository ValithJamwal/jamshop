// lib/cart_item.dart
class CartItem {
  final String name;
  final double price;
  final String imageAsset; // The path to the image asset
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageAsset,
    this.quantity = 1,
  });
}
