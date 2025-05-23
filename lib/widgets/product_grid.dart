import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const Center(
      child: Text('No products found!'),
    )
        : GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 25,
      ),
      itemBuilder: (ctx, i) => ProductItem(
        id: products[i].id,
        title: products[i].title,
        imageUrl: products[i].imageUrl,
        price: products[i].price,
        inStock: products[i].inStock,
      ),
    );
  }
}
