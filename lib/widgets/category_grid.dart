import 'package:flutter/material.dart';
import '../models/product.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final Function(String) onCategorySelected;
  final String? selectedCategory;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (ctx, i) => GestureDetector(
        onTap: () => onCategorySelected(categories[i].id),
        child: Container(
          width: 100,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: selectedCategory == categories[i].id
                ? const Color(0xFF0D8AFF).withOpacity(0.2)
                : const Color(0xFF232A35),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selectedCategory == categories[i].id
                  ? const Color(0xFF0D8AFF)
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                categories[i].imageUrl,
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 15),
              Text(
                categories[i].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: selectedCategory == categories[i].id
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
