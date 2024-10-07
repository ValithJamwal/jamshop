// lib/order_page.dart
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Center(
        child: Text('Your Orders'),
      ),
    );
  }
}
