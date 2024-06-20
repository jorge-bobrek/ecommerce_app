import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:fake_store_widgets_package/presentation/atoms/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_control_widget.dart';
import 'package:provider/provider.dart';

/// A widget that displays product information in a card.
class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItem = cartProvider.cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image ?? '',
                  height: 120,
                ),
              ),
              const SizedBox(height: 8),
              TitleWidget(text: product.title, size: 16),
              const SizedBox(height: 4),
              TextWidget(
                  text: '\$${product.price}', size: 14, color: Colors.green),
              const Spacer(),
              Center(
                child: CartControlWidget(
                  cartItem: cartItem,
                  orientation: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
