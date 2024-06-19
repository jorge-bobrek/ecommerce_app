import 'package:ecommerce_app/features/product/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    // Fetch the list of products when the home page is initialized.
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Página de Inicio'),
      ),
    );
  }
}
