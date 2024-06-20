import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fake_store_widgets_package/presentation/atoms/icon_button_widget.dart';
import 'package:fake_store_widgets_package/presentation/atoms/label_widget.dart';

/// A widget that provides controls for managing a cart item.
///
/// The [QuantityControlsWidget] displays buttons to increase, decrease, or remove
/// the quantity of a product in the cart, as well as the current quantity.
class QuantityControlsWidget extends StatelessWidget {
  final CartItem cartItem;
  final Axis orientation;

  const QuantityControlsWidget(
      {super.key, required this.cartItem, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final controls = [
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
    ];

    return orientation == Axis.vertical
        ? Column(children: controls)
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controls.reversed.toList(),
          );
  }
}
