import 'package:flutter/material.dart';

import '../cart.dart';
import '../money.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order summary')),
      body: ListView(
        children: [
          for (final line in cart.lines)
            ListTile(
              key: Key('summary-${line.product.id}'),
              title: Text(line.product.name),
              subtitle: Text('Quantity: ${line.quantity}'),
              trailing: Text(euro.format(line.total)),
            ),
          ListTile(
            key: const Key('summary-total'),
            title: const Text('Total'),
            trailing: Text(euro.format(cart.total)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              key: const Key('pay'),
              onPressed: () {},
              child: const Text('Pay'),
            ),
          ),
        ],
      ),
    );
  }
}
