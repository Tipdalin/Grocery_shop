import 'package:flutter/material.dart';
import '../models/item.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);

  get items => null;

  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
