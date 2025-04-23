class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> products = [
      Product('Laptop', 'Laptop', 1000, 'assets/laptop.jpg'),
      Product('Mobile', 'Mobile', 500, 'assets/mobile.jpg'),
      Product('Tablet', 'Tablet', 800, 'assets/tablet.jpg'),

    ];

    return products;
  }
}
