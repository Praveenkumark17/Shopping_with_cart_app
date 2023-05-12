import 'package:flutter/material.dart';
import 'shopping_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  final ShoppingCart cart;

  ShoppingCartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Shopping Cart (${cart.items.length})'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final itemEntry = cart.items[index];
          final item = itemEntry.key;
          final quantity = itemEntry.value;
          return ListTile(
            title: Text('${item.name} x $quantity'),
            subtitle: Text('\₹${(item.price * quantity).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Total: \₹${cart.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Checkout'),
        icon: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

