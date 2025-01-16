import 'package:ecommerce_app/data/data/repositories/product_repo.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;
  ProductProvider({required this.productRepo});

  bool isLoading = false;
  List<Product> products = [];

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
