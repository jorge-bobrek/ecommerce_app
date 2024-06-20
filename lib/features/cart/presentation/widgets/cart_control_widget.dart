import 'package:ecommerce_app/features/cart/presentation/widgets/add_to_cart_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/quantity_controls_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';

/// A widget that provides controls for managing a cart item.
///
/// The [CartControlWidget] displays buttons to increase, decrease, or remove
/// the quantity of a product in the cart, as well as the current quantity.
class CartControlWidget extends StatelessWidget {
  /// Creates an instance of [CartControlWidget].
  const CartControlWidget(
      {super.key, required this.cartItem, required this.orientation});

  /// The cart item to be controlled.
  final CartItem cartItem;

  /// The orientation of the control widget.
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    return cartItem.quantity > 0
        ? QuantityControlsWidget(cartItem: cartItem, orientation: orientation)
        : AddToCartWidget(product: cartItem.product);
  }
}
