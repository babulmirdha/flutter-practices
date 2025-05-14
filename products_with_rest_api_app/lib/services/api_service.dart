import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const baseUrl = "http://localhost:3000/products";

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    return (json.decode(response.body) as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  static Future<Product> fetchProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    return Product.fromJson(json.decode(response.body));
  }

  static Future<Product> createProduct(Product product) async {
    final response = await http.post(Uri.parse(baseUrl),
        body: json.encode(product.toJson()),
        headers: {'Content-Type': 'application/json'});
    return Product.fromJson(json.decode(response.body));
  }

  static Future<Product> updateProduct(Product product) async {
    final response = await http.put(Uri.parse('$baseUrl/${product.id}'),
        body: json.encode(product.toJson()),
        headers: {'Content-Type': 'application/json'});
    return Product.fromJson(json.decode(response.body));
  }

  static Future<void> deleteProduct(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
