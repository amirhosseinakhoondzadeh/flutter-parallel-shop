import 'package:flutter/material.dart';

import '../cart.dart';
import '../money.dart';
import 'summary_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListenableBuilder(
        listenable: cart,
        builder: (context, _) => ListView(
          children: [
            for (final line in cart.lines)
              ListTile(
                title: Text('${line.quantity} x ${line.product.name}'),
                trailing: Text(formatCents(line.totalCents)),
              ),
            ListTile(
              title: const Text('Total'),
              trailing: Text(formatCents(cart.totalCents)),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                key: const Key('checkout'),
                onPressed: cart.lines.isEmpty
                    ? null
                    : () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SummaryScreen(cart: cart),
                          ),
                        ),
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
