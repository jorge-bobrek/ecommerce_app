// lib/presentation/pages/cart_page.dart
import 'package:ecommerce_app/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/presentation/widgets/cart_control_widget.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
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
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];
                    return ProductItemWidget(
                      product: ProductMapper.toModel(cartItem.product),
                      trailing: CartControlWidget(cartItem: cartItem)
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementa la lógica para proceder al pago o finalizar la compra
                },
                child: const Text('Proceder al Pago'),
              ),
            ],
          );
        },
      ),
    );
  }
}
