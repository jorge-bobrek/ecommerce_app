import 'package:ecommerce_app/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:fake_store_widgets_package/presentation/atoms/icon_button_widget.dart';
import 'package:fake_store_widgets_package/presentation/atoms/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartControlWidget extends StatelessWidget {
  const CartControlWidget({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        IconButtonWidget(
          icon: Icons.add_circle_outline,
          onPressed: () {
            cartProvider.addProduct(cartItem.product);
          },
          color: Colors.green,
        ),
        LabelWidget(text: '${cartItem.quantity}', size: 16),
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
