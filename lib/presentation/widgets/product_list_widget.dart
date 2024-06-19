import 'package:ecommerce_app/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that displays a list of products.
///
/// The [ProductListWidget] fetches the list of products from the [ProductProvider]
/// and displays each product using the [ProductItemWidget]. It also provides the
/// functionality to add products to the cart.
class ProductListWidget extends StatelessWidget {
  /// Creates an instance of [ProductListWidget].
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // Shows a loading indicator if the list of filtered products is empty
    if (productProvider.filteredProducts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Builds a ListView of products
    return ListView.builder(
      itemCount: productProvider.filteredProducts.length,
      itemBuilder: (context, index) {
        final product = productProvider.filteredProducts[index];
        return ProductItemWidget(
          product: ProductMapper.toModel(product),
          
          /// Navigates to the product detail page when the product is tapped.
          onTap: () {
            Navigator.pushNamed(
              context,
              '/product-detail',
              arguments: product.id,
            );
          },
          
          /// Displays an icon button to add the product to the cart.
          trailing: IconButtonWidget(
            icon: Icons.add_shopping_cart,
            
            /// Adds the product to the cart and shows a snackbar notification.
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
