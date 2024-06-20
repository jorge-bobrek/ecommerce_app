import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_control_widget.dart';
import 'package:ecommerce_app/features/product/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/features/product/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/features/product/presentation/providers/product_provider.dart';
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
        final cartItem =
            Provider.of<CartProvider>(context).cartItems.firstWhere(
                  (item) => item.product.id == product.id,
                  orElse: () => CartItem(product: product, quantity: 0),
                );
        return ProductItemWidget(
          product: ProductMapper.toModel(product),

          /// Navigates to the product detail page when the product is tapped.
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(productId: product.id!),
              ),
            );
          },

          /// Displays an icon button to add the product to the cart.
          trailing: CartControlWidget(
            cartItem: cartItem,
            orientation: Axis.vertical,
          ),
        );
      },
    );
  }
}
