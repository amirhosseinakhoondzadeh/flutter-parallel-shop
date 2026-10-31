import 'package:flutter_test/flutter_test.dart';
import 'package:shop/cart.dart';
import 'package:shop/catalog.dart';
import 'package:shop/checkout.dart';

void main() {
  test('a €19.99 cart sends 1999', () {
    final cart = Cart()..add(catalog.firstWhere((p) => p.id == 'tote'));
    expect(paymentAmount(cart), 1999);
  });
}
