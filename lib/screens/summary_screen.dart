import 'package:flutter/material.dart';

import '../cart.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order summary')),
      body: const Center(child: Text('Order summary coming soon')),
    );
  }
}
