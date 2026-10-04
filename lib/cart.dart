import 'package:flutter/foundation.dart';

import 'catalog.dart';

class CartLine {
  CartLine(this.product, this.quantity);

  final Product product;
  int quantity;

  int get totalCents => product.priceCents * quantity;
}

class Cart extends ChangeNotifier {
  final List<CartLine> _lines = [];

  List<CartLine> get lines => List.unmodifiable(_lines);

  int get itemCount => _lines.fold(0, (sum, line) => sum + line.quantity);

  int get totalCents => _lines.fold(0, (sum, line) => sum + line.totalCents);

  void add(Product product) {
    for (final line in _lines) {
      if (line.product.id == product.id) {
        line.quantity++;
        notifyListeners();
        return;
      }
    }
    _lines.add(CartLine(product, 1));
    notifyListeners();
  }
}
