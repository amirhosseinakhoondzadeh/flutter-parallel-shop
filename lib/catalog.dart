class Product {
  const Product({required this.id, required this.name, required this.price});

  final String id;
  final String name;

  /// Price in euros.
  final double price;
}

const catalog = [
  Product(id: 'mug', name: 'Ceramic mug', price: 12.99),
  Product(id: 'tote', name: 'Canvas tote', price: 19.99),
  Product(id: 'notebook', name: 'Dot grid notebook', price: 8.50),
];
