import 'dart:math';

import 'package:ecommerce_app/features/product/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/promotion_banner.dart';
import 'package:provider/provider.dart';

/// A widget to display promotions.
class PromotionsWidget extends StatelessWidget {
  const PromotionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final productProvider = Provider.of<ProductProvider>(context);
    final productIds =
        productProvider.products.map((product) => product.id).toList();
    final colors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
    ];
    const loading = Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(width: 80, child: CircularProgressIndicator()),
    );
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          productIds.isNotEmpty
              ? PromotionBanner(
                  title: '¡Gran Venta!',
                  description:
                      'Obtén hasta un 50% de descuento en artículos seleccionados.',
                  color: colors[random.nextInt(colors.length)],
                  productId: productIds[random.nextInt(colors.length)] ?? 0,
                )
              : loading,
          productIds.isNotEmpty
              ? PromotionBanner(
                  title: 'Oferta por Tiempo Limitado',
                  description:
                      '¡Apresúrate! Oferta válida hasta agotar existencias.',
                  color: colors[random.nextInt(colors.length)],
                  productId: productIds[random.nextInt(colors.length)]!,
                )
              : loading,
        ],
      ),
    );
  }
}
