import 'package:ecommerce_app/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/presentation/widgets/app_bar_widget.dart';
import 'package:fake_store_widgets_package/presentation/organisms/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page that displays the details of a selected product.
///
/// The [ProductDetailPage] shows detailed information about a product and provides
/// an option to add the product to the cart.
class ProductDetailPage extends StatelessWidget {
  /// The ID of the product to display.
  final int productId;

  /// Creates an instance of [ProductDetailPage].
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product =
        productProvider.products.firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBarWidget(
        title: product.title ?? 'Detalles del Producto',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: ProductDetailsWidget(
                                  product: ProductMapper.toModel(product)),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Image.network(
                                product.image!,
                                width: 200,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image.network(
                                  product.image!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ProductDetailsWidget(
                                  product: ProductMapper.toModel(product)),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<CartProvider>(context, listen: false).addProduct(product);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Producto añadido al carrito')),
          );
        },
        label: const Text('Añadir al carrito'),
        icon: const Icon(Icons.add_shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
