import 'package:ecommerce_app/features/home/presentation/widgets/product_card_widget.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/product/presentation/pages/product_detail_page.dart';

/// A widget to display featured products.
class FeaturedProductsWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const FeaturedProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(productId: product.id!),
                ),
              );
            },
            child: ProductCardWidget(
              product: product,
            ),
          );
        },
      ),
    );
  }
}
