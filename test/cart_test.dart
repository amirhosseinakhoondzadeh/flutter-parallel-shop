import 'package:flutter_test/flutter_test.dart';
import 'package:shop/cart.dart';
import 'package:shop/catalog.dart';
import 'package:shop/checkout.dart';

void main() {
  Product byId(String id) => catalog.firstWhere((p) => p.id == id);

  test('total adds up every line', () {
    final cart = Cart()
      ..add(byId('mug'))
      ..add(byId('mug'))
      ..add(byId('tote'));
    expect(cart.total, closeTo(45.97, 1e-9));
    expect(cart.itemCount, 3);
  });

  test('a mug is charged 1299 cents', () {
    final cart = Cart()..add(byId('mug'));
    expect(paymentAmount(cart), 1299);
  });
}
