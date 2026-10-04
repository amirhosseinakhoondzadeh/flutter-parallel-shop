import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/cart.dart';
import 'package:shop/catalog.dart';
import 'package:shop/main.dart';
import 'package:shop/screens/summary_screen.dart';

void main() {
  Product byId(String id) => catalog.firstWhere((p) => p.id == id);

  Finder inSummaryRow(String productId, String text) => find.descendant(
        of: find.byKey(Key('summary-$productId')),
        matching: find.text(text),
      );

  testWidgets('summary lists every line and the order total', (tester) async {
    final cart = Cart()
      ..add(byId('mug'))
      ..add(byId('mug'))
      ..add(byId('tote'));

    await tester.pumpWidget(MaterialApp(home: SummaryScreen(cart: cart)));

    expect(find.byType(ListTile), findsNWidgets(3));

    expect(inSummaryRow('mug', 'Ceramic mug'), findsOneWidget);
    expect(inSummaryRow('mug', 'Quantity: 2'), findsOneWidget);
    expect(inSummaryRow('mug', '€25.98'), findsOneWidget);

    expect(inSummaryRow('tote', 'Canvas tote'), findsOneWidget);
    expect(inSummaryRow('tote', 'Quantity: 1'), findsOneWidget);
    expect(inSummaryRow('tote', '€19.99'), findsOneWidget);

    expect(
      find.descendant(
        of: find.byKey(const Key('summary-total')),
        matching: find.text('€45.97'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('the pay button is there and does nothing', (tester) async {
    final cart = Cart()..add(byId('mug'));

    await tester.pumpWidget(MaterialApp(home: SummaryScreen(cart: cart)));

    final pay = find.byKey(const Key('pay'));
    expect(pay, findsOneWidget);
    expect(tester.widget<FilledButton>(pay).onPressed, isNotNull);

    await tester.tap(pay);
    await tester.pumpAndSettle();

    expect(find.byType(SummaryScreen), findsOneWidget);
  });

  testWidgets('checkout opens the summary instead of a placeholder',
      (tester) async {
    await tester.pumpWidget(ShopApp());

    await tester.tap(find.byKey(const Key('add-mug')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('open-cart')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('checkout')));
    await tester.pumpAndSettle();

    expect(find.byType(SummaryScreen), findsOneWidget);
    expect(inSummaryRow('mug', 'Ceramic mug'), findsOneWidget);
    expect(find.text('Order summary coming soon'), findsNothing);
  });
}
