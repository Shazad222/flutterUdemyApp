import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String id = '/product-screen'; // Corrected route path

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Product Screen"),
    );
  }
}
