import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:fake_store_widgets_package/presentation/atoms/icon_button_widget.dart';
import 'package:fake_store_widgets_package/presentation/atoms/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that provides controls for managing a cart item.
///
/// The [CartControlWidget] displays buttons to increase, decrease, or remove
/// the quantity of a product in the cart, as well as the current quantity.
class CartControlWidget extends StatelessWidget {
  /// Creates an instance of [CartControlWidget].
  const CartControlWidget({super.key, required this.cartItem});

  /// The cart item to be controlled.
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        /// Button to increase the quantity of the product in the cart.
        IconButtonWidget(
          icon: Icons.add_circle_outline,
          onPressed: () {
            cartProvider.addProduct(cartItem.product);
          },
          color: Colors.green,
        ),

        /// Label displaying the current quantity of the product in the cart.
        LabelWidget(text: '${cartItem.quantity}', size: 16),

        /// Button to decrease the quantity of the product in the cart or remove it if the quantity is 1.
        IconButtonWidget(
          icon: cartItem.quantity > 1
              ? Icons.remove_circle_outline
              : Icons.delete_outline,
          onPressed: () {
            cartProvider.removeProduct(cartItem.product);
          },
          color: cartItem.quantity > 1 ? Colors.amber : Colors.red,
        ),
      ],
    );
  }
}
