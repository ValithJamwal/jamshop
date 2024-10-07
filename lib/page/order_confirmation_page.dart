// lib/order_confirmation_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/cart_provider.dart';

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('No items in the cart.'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Image.asset(
                      item.imageAsset,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.name),
                    subtitle: Text(
                        'Price: \$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                  ),
                );
              },
            ),
    );
  }
}
