class Product {
  final int id;
  final String name;
  final double price;
  final String description;

  Product({required this.id, required this.name, required this.price, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    price: json['price'].toDouble(),
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
  };
}
