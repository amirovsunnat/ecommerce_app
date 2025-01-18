import 'package:ecommerce_app/data/data/repositories/product_repo.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;
  ProductProvider({required this.productRepo});

  bool isLoading = false;
  List<Product> products = [];
  List<Product> filteredProducts = [];

  // filter products
  void filterProducts(String query) {
    if (products.isNotEmpty) {
      filteredProducts = products
          .where(
            (product) =>
                product.title!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }

  // clear filtered products
  void clearFilteredProducts() {
    filteredProducts.clear();
    notifyListeners();
  }

  // get products
  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    final result = await productRepo.fetchProducts();
    products = result.products ?? [];
    isLoading = false;
    notifyListeners();
  }
}
