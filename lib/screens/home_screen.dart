import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_grid.dart';
import '../widgets/category_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategory;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Product> get filteredProducts {
    return Buildhive_Products.where((product) {
      final matchesCategory = _selectedCategory == null || product.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          product.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildHive Marketplace'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(Buildhive_Products),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for parts...',
                hintStyle: const TextStyle(color: Color(0xFFB0B8C1)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFB0B8C1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFF171E27),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Container(
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: CategoryGrid(
                    categories: Buildhive_Categories,
                    onCategorySelected: (categoryId) {
                      setState(() {
                        _selectedCategory = _selectedCategory == categoryId ? null : categoryId;
                      });
                    },
                    selectedCategory: _selectedCategory,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedCategory == null
                            ? 'All Products'
                            : Buildhive_Categories.firstWhere((cat) => cat.id == _selectedCategory).title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_selectedCategory != null)
                        TextButton.icon(
                          icon: const Icon(Icons.clear),
                          label: const Text('Clear Filter'),
                          onPressed: () {
                            setState(() {
                              _selectedCategory = null;
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ProductGrid(products: filteredProducts),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((product) =>
    product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.description.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ProductGrid(products: results),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: Image.network(
          suggestions[i].imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(suggestions[i].title),
        subtitle: Text('₱${suggestions[i].price.toStringAsFixed(2)}'),
        onTap: () {
          query = suggestions[i].title;
          showResults(context);
        },
      ),
    );
  }
}
