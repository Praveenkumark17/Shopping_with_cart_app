import 'package:flutter/material.dart';
import 'shopping_item.dart';

class ShoppingCart {
  //  List<ShoppingItem> _items = [];

  //  List<ShoppingItem> get items => _items;

final Map<ShoppingItem, int> _items = {};

  void addItem(ShoppingItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
  }

  List<MapEntry<ShoppingItem, int>> get items => _items.entries.toList();

  // double get totalPrice =>
  //     _items.entries.fold(0, (total, entry) => total + entry.key.price * entry.value);
  double get totalPrice =>
  _items.entries.fold(0, (total, entry) => total + entry.key.price * entry.value);

  void removeItem(ShoppingItem item) {
    if (_items.containsKey(item)) {
      if (_items[item]! > 1) {
        _items[item] = _items[item]! - 1;
      } else {
        _items.remove(item);
      }
    }
  }

  int itemCount() {
    return _items.values.fold(0, (total, count) => total + count);
  }

  int getItemCount(ShoppingItem item) {
    return _items[item] ?? 0;
  }
}
