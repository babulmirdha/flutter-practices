import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  void fetchAll() async {
    products.value = await ApiService.fetchProducts();
  }

  void select(Product product) {
    selectedProduct.value = product;
  }

  void delete(int id) async {
    await ApiService.deleteProduct(id);
    fetchAll();
    selectedProduct.value = null;
  }

  void add(Product product) async {
    await ApiService.createProduct(product);
    fetchAll();
  }

  void updateProduct(Product product) async {
    await ApiService.updateProduct(product);
    fetchAll();
    selectedProduct.value = null;
  }
}
