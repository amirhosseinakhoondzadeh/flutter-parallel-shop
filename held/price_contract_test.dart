import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/main.dart';

final _amount = RegExp(r'€[0-9][0-9,]*\.[0-9]{2}');

List<String> _amountsOnScreen(WidgetTester tester) => [
      for (final t in tester.widgetList<Text>(find.byType(Text)))
        ..._amount
            .allMatches(t.data ?? t.textSpan?.toPlainText() ?? '')
            .map((m) => m.group(0)!),
    ];

void main() {
  testWidgets('one €12.99 mug reads €12.99 on every screen', (tester) async {
    await tester.pumpWidget(ShopApp());
    await tester.tap(find.byKey(const Key('add-mug')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('open-cart')));
    await tester.pumpAndSettle();
    expect(_amountsOnScreen(tester), isNotEmpty);
    expect(_amountsOnScreen(tester), everyElement('€12.99'));

    await tester.tap(find.byKey(const Key('checkout')));
    await tester.pumpAndSettle();
    expect(_amountsOnScreen(tester), everyElement('€12.99'));
  });
}
