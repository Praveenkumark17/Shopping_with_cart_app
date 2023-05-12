import 'package:flutter/material.dart';
import 'package:shop/shopping_cart_screen.dart';
import 'shopping_cart.dart';
import 'shopping_item.dart';

class ShoppingList extends StatefulWidget {
  final ShoppingCart cart;

  ShoppingList({required this.cart});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _items = <ShoppingItem>[
    ShoppingItem(name: 'Apples', price: 100),
    ShoppingItem(name: 'Bananas', price: 50),
    ShoppingItem(name: 'Oranges', price: 75.25),
    ShoppingItem(name: 'Grapes', price: 150.52),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(cart: widget.cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\₹${item.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      widget.cart.removeItem(item);
                    });
                  },
                ),
                Text(
                  widget.cart.getItemCount(item).toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.cart.addItem(item);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
