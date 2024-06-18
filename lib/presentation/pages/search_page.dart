import 'package:ecommerce_app/presentation/widgets/product_list_widget.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchFormWidget(
              controller: TextEditingController(),
              onSearch: () {
                // TODO: Implementar búsqueda
              },
            ),
          ),
          const Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}
