// lib/add_to_cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/cart_provider.dart';

class AddToCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Calculate the total price
    double totalPrice = cartProvider.cartItems.fold(
      0.0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Add to Cart')),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
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
                    subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cartProvider.decrementQuantity(item.name);
                          },
                        ),
                        Text(item.quantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartProvider.incrementQuantity(item.name);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cartProvider.removeFromCart(item.name);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle buy now action
                  // You can implement the checkout process here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Place Order'),
                        content: Text('Proceed to place the order?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Implement your payment logic here
                              Navigator.of(context).pop();
                            },
                            child: Text('Proceed'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('place the order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
