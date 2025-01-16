import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<ProductModel> fetchProducts() async {
    final products = "https://fakestoreapi.in/api/products";
    final url = Uri.parse(products);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        log("Response from backend: ${response.body}");
        log("Response status code: ${response.statusCode}");
        final data = jsonDecode(response.body);
        return ProductModel.fromJson(data);
      }
      throw Exception(
        "Error happened while loading products, please try again.",
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
