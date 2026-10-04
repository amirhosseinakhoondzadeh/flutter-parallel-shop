import 'package:flutter/material.dart';

import '../cart.dart';
import '../catalog.dart';
import '../money.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          ListenableBuilder(
            listenable: cart,
            builder: (context, _) => TextButton(
              key: const Key('open-cart'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CartScreen(cart: cart)),
              ),
              child: Text('Cart (${cart.itemCount})'),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final product in catalog)
            ListTile(
              title: Text(product.name),
              subtitle: Text(euro.format(product.price)),
              trailing: IconButton(
                key: Key('add-${product.id}'),
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () => cart.add(product),
              ),
            ),
        ],
      ),
    );
  }
}
