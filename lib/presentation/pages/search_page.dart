import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/presentation/widgets/category_dropdown.dart';
import 'package:ecommerce_app/presentation/widgets/product_list_widget.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page that allows users to search and filter products.
///
/// The [SearchPage] provides a search form and a category dropdown to filter
/// products, and displays the filtered products in a list.
class SearchPage extends StatefulWidget {
  /// Creates an instance of [SearchPage].
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  /// A controller for managing the text input in the search form.
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    /// A search form widget for entering search queries.
                    Expanded(
                      child: SearchFormWidget(
                        controller: _searchController,
                        onSearch: (query) {
                          provider.filterProducts(query);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),

                    /// A dropdown widget for selecting a product category.
                    CategoryDropdownWidget(
                      selectedCategory: provider.selectedCategory,
                      onChanged: (category) {
                        _searchController.text = "";
                        provider.fetchProductsInCategory(category!);
                      },
                    ),
                  ],
                ),
              ),

              /// A widget that displays the list of filtered products.
              const Expanded(
                child: ProductListWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
