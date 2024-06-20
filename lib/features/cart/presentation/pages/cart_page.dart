import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_control_widget.dart';
import 'package:ecommerce_app/features/product/data/mappers/product_mapper.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page that displays the shopping cart.
///
/// The [CartPage] shows the items in the cart, allows adjusting their quantities,
/// and displays the total price. It also provides an option to proceed to checkout.
class CartPage extends StatelessWidget {
  /// Creates an instance of [CartPage].
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartController, child) {
          return Column(
            children: [
              /// Displays the list of items in the cart.
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];
                    return ProductItemWidget(
                      product: ProductMapper.toModel(cartItem.product),
                      trailing: CartControlWidget(
                        cartItem: cartItem,
                        orientation: Axis.vertical,
                      ),
                    );
                  },
                ),
              ),
              
              /// Displays the total price of the items in the cart.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              
              /// Button to proceed to checkout.
              ElevatedButton(
                onPressed: () {},
                child: const Text('Ir a pagar'),
              ),
            ],
          );
        },
      ),
    );
  }
}
