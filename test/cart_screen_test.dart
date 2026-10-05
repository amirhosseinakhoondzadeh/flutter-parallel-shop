import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/cart.dart';
import 'package:shop/catalog.dart';
import 'package:shop/screens/cart_screen.dart';

void main() {
  Product byId(String id) => catalog.firstWhere((p) => p.id == id);

  testWidgets('cart shows line totals and the cart total', (tester) async {
    final cart = Cart()
      ..add(byId('mug'))
      ..add(byId('mug'))
      ..add(byId('tote'));

    await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

    expect(find.text('€25.98'), findsOneWidget);
    expect(find.text('€19.99'), findsOneWidget);
    expect(find.text('€45.97'), findsOneWidget);
  });
}
