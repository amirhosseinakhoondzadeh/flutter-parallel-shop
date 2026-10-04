class Product {
  const Product({
    required this.id,
    required this.name,
    required this.priceCents,
  });

  final String id;
  final String name;

  /// Price in cents.
  final int priceCents;
}

const catalog = [
  Product(id: 'mug', name: 'Ceramic mug', priceCents: 1299),
  Product(id: 'tote', name: 'Canvas tote', priceCents: 1999),
  Product(id: 'notebook', name: 'Dot grid notebook', priceCents: 850),
];
