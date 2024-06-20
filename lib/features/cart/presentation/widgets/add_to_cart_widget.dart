import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:fake_store_widgets_package/presentation/atoms/icon_button_widget.dart';

/// A button to add a product to the cart.
class AddToCartWidget extends StatelessWidget {
  final ProductEntity product;

  const AddToCartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      icon: Icons.add_shopping_cart,
      onPressed: () {
        Provider.of<CartProvider>(context, listen: false).addProduct(product);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Producto añadido al carrito'),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}