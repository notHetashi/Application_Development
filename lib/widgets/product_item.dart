import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final bool inStock;

  const ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
//For Product Grid
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: const Color(0xFF171E27).withOpacity(0.9),
          title: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            '₱${price.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF8BC34A)),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: const Color(0xFF0D8AFF),
            onPressed: inStock
                ? () {
              cart.addItem(id, price, title, imageUrl);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Added item to cart!'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: const Color(0xFF232A35),
                  action: SnackBarAction(
                    label: 'UNDO',
                    textColor: const Color(0xFF0D8AFF),
                    onPressed: () {
                      cart.removeSingleItem(id);
                    },
                  ),
                ),
              );
            }
                : null,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              if (!inStock)
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: Text(
                      'OUT OF STOCK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
