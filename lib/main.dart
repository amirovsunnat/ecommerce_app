import 'package:ecommerce_app/data/data/repositories/product_repo.dart';
import 'package:ecommerce_app/presentation/screens/products_screen.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(
        productRepo: ProductRepo(),
      )..getProducts(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
