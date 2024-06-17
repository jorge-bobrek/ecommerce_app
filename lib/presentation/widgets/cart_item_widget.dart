import 'package:ecommerce_app/domain/entities/cart_item_entity.dart';
import 'package:fake_store_widgets_package/presentation/atoms/product_image_widget.dart';
import 'package:fake_store_widgets_package/presentation/molecules/product_info_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ProductImageWidget(imageUrl: cartItem.product.image),
              const SizedBox(width: 10),
              Expanded(
                child: ProductInfoWidget(
                  title: cartItem.product.title,
                  price: cartItem.product.price,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
