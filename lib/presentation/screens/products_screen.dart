import 'dart:developer';

import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
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
          );
        },
      ),
    );
  }
}
