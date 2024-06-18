import 'package:ecommerce_app/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    if (productProvider.filteredProducts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: productProvider.filteredProducts.length,
      itemBuilder: (context, index) {
        final product = productProvider.filteredProducts[index];
        return ProductItemWidget(
          product: ProductMapper.toModel(product),
          onTap: () {
            Navigator.pushNamed(context, '/product-detail',
                arguments: product.id);
          },
          trailing: IconButtonWidget(
            icon: Icons.add_shopping_cart,
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Producto añadido al carrito'),
                  duration: Durations.long4,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
