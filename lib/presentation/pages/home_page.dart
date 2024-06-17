import 'package:ecommerce_app/presentation/pages/cart_page.dart';
import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/presentation/widgets/product_list_widget.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Los Recuerdos De Ella'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
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
