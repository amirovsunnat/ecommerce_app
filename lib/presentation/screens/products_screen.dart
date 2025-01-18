import 'dart:developer';

import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final query = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    query.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          log("coming data lenght: ${productProvider.products.length}");

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (query) {
                      productProvider.filterProducts(query);
                    },
                    decoration: InputDecoration(
                      suffixIcon: query.text.trim().isEmpty
                          ? Icon(Icons.search)
                          : IconButton(
                              onPressed: () {
                                query.clear();
                                productProvider.clearFilteredProducts();
                              },
                              icon: Icon(
                                Icons.clear,
                              ),
                            ),
                      labelText: 'Qidiruv',
                      border: OutlineInputBorder(),
                    ),
                    controller: query,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: productProvider.filteredProducts.isNotEmpty
                          ? productProvider.filteredProducts.length
                          : productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product =
                            productProvider.filteredProducts.isNotEmpty
                                ? productProvider.filteredProducts[index]
                                : productProvider.products[index];
                        return SizedBox(
                          height: 300,
                          child: ProductCard(
                            title: product.title.toString(),
                            image: product.image.toString(),
                            price: product.price!,
                            rating: 5.0,
                            reviewCount: 10,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
