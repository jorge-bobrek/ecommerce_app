import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/presentation/widgets/category_dropdown.dart';
import 'package:ecommerce_app/presentation/widgets/product_list_widget.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
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
                    Expanded(
                      child: SearchFormWidget(
                        controller: _searchController,
                        onSearch: (query) {
                          provider.filterProducts(query);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
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
