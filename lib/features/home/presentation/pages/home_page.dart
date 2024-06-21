import 'package:ecommerce_app/features/home/presentation/widgets/featured_products_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/promotions_widget.dart';
import 'package:ecommerce_app/features/product/presentation/providers/product_provider.dart';
import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// The home page of the application.
///
/// The [HomePage] fetches the list of products when it is initialized and
/// displays a simple message in the center of the screen.
class HomePage extends StatefulWidget {
  /// Creates an instance of [HomePage].
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final loading = const Padding(
    padding: EdgeInsets.all(20),
    child: SizedBox(
      height: 100,
      width: 100,
      child: CircularProgressIndicator(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWidget(text: 'Promociones', size: 24),
              const PromotionsWidget(),
              const SizedBox(height: 20),
              const LabelWidget(text: 'Productos Destacados', size: 24),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.products.isEmpty) {
                    return SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          loading,
                          loading,
                          loading,
                        ],
                      ),
                    );
                  } else {
                    return FeaturedProductsWidget(
                      products: productProvider.featuredProducts,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
