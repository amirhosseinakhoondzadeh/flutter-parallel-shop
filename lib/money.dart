import 'package:intl/intl.dart';

final _euro = NumberFormat.currency(locale: 'en_IE', symbol: '€');

/// Formats an amount in cents for display, for example 1299 as €12.99.
String formatCents(int cents) => _euro.format(cents / 100);
