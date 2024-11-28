class Product {
  String name;
  int quantity;
  double price;

  Product({required this.name, required this.quantity, required this.price});

  @override
  String toString() {
    return 'Product(name: $name, quantity: $quantity, price: $price)';
  }
}