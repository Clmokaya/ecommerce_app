import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: 'Product 1',
        price: 99.99,
        description: 'item description',
        imagePath: 'assets/bag.png'),
    Product(
        name: 'Product 1',
        price: 99.99,
        description: 'item description',
        imagePath: 'assets/sunglasses.png'),
    Product(
        name: 'Product 1',
        price: 99.99,
        description: 'item description',
        imagePath: 'assets/watch.png'),
    Product(
        name: 'Product 1',
        price: 99.99,
        description: 'item description',
        imagePath: 'assets/bag.png')
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
