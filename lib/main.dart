import 'package:flutter/material.dart';

import 'cart.dart';
import 'screens/catalog_screen.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  ShopApp({super.key});

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      home: CatalogScreen(cart: cart),
    );
  }
}
