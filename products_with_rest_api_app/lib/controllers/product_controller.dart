import 'package:get/get.dart';
import '../models/product.dart';
import '../services/product_api_service.dart';

class ProductController extends GetxController {

  var products = <Product>[].obs;

  var selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    fetchAll();
    super.onInit();
  }

  void fetchAll() async {
    products.value = await ProductApiService.fetchProducts();
  }

  void select(Product product) {
    selectedProduct.value = product;
  }

  void delete(int id) async {
    await ProductApiService.deleteProduct(id);
    fetchAll();
    selectedProduct.value = null;
  }

  // REVIEW: Ask team if this logic belongs in ViewModel
  void add(Product product) async {
    await ProductApiService.createProduct(product);
    products.value.insert(0,product);
    products.refresh(); // Notifies listeners
   //FIXME: enable if required
   // fetchAll();
  }

  void updateProduct(Product product) async {
    await ProductApiService.updateProduct(product);
    fetchAll();
    selectedProduct.value = null;
  }
}
