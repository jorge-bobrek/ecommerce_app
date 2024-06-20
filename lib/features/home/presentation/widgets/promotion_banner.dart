import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/product/presentation/pages/product_detail_page.dart';

/// A widget to display a promotion banner.
class PromotionBanner extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final int productId;

  const PromotionBanner({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: productId),
          ),
        )
      },
      child: Container(
        height: 120,
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: color,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
