import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/main.dart';

void main() {
  testWidgets('summary lists two mugs and a tote, total €45.97', (tester) async {
    await tester.pumpWidget(ShopApp());
    await tester.tap(find.byKey(const Key('add-mug')));
    await tester.tap(find.byKey(const Key('add-mug')));
    await tester.tap(find.byKey(const Key('add-tote')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('open-cart')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('checkout')));
    await tester.pumpAndSettle();
    expect(find.textContaining('Ceramic mug'), findsWidgets);
    expect(find.textContaining('Canvas tote'), findsWidgets);
    expect(find.textContaining('€45.97'), findsWidgets);
  });
}
