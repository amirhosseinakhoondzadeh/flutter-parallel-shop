import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/main.dart';

void main() {
  testWidgets('catalog shows prices and adds to the cart', (tester) async {
    await tester.pumpWidget(ShopApp());
    expect(find.text('€12.99'), findsOneWidget);
    await tester.tap(find.byKey(const Key('add-mug')));
    await tester.pump();
    expect(find.text('Cart (1)'), findsOneWidget);
  });
}
