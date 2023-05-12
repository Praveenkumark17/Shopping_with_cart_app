import 'package:flutter/material.dart';
import 'shopping_cart.dart';
import 'shopping_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cart = ShoppingCart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.green, // Change this to the desired color
      ),
      home: ShoppingList(cart: cart),
    );
  }
}
