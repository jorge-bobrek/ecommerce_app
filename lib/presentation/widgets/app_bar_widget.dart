import 'package:ecommerce_app/presentation/pages/cart_page.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:fake_store_widgets_package/presentation/molecules/icon_with_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            int totalQuantity = 0;
            for (var item in cartProvider.cartItems) {
              totalQuantity += item.quantity;
            }
            return IconWithCounterWidget(
              itemCount: totalQuantity,
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
