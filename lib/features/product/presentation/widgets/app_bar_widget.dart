import 'package:ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:fake_store_widgets_package/presentation/molecules/icon_with_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A custom app bar widget that includes a title and a cart icon with a counter.
///
/// The [AppBarWidget] displays the title of the current page and a cart icon
/// that shows the total quantity of items in the cart. Tapping the cart icon
/// navigates to the [CartPage].
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  /// Creates an instance of [AppBarWidget].
  const AppBarWidget({super.key, required this.title});

  /// The title to be displayed in the app bar.
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
