import 'package:ecommerce_app/features/product/presentation/pages/home_page.dart';
import 'package:ecommerce_app/features/authentication/presentation/pages/login_page.dart';
import 'package:ecommerce_app/features/product/presentation/pages/main_page.dart';
import 'package:ecommerce_app/features/cart/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/features/product/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/features/product/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/features/authentication/presentation/providers/user_provider.dart';
import 'package:fake_store_api_package/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The main entry point of the application.
void main() {
  runApp(const MainApp());
}

/// The root widget of the application.
///
/// This widget sets up the [MultiProvider] to manage the state of the application
/// and defines the main structure and navigation of the app.
class MainApp extends StatelessWidget {
  /// Creates an instance of [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Provides the [ProductProvider] to manage the product catalog.
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
            catalog: Catalog(),
          ),
        ),

        /// Provides the [CartProvider] to manage the shopping cart.
        ChangeNotifierProvider(create: (_) => CartProvider()),

        /// Provides the [UserProvider] to manage user information and authentication state.
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Los Recuerdos De Ella',

        /// Sets the primary theme of the application.
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// Defines the home page of the application based on the user's authentication state.
        home: Consumer<UserProvider>(
          builder: (context, userController, _) {
            return userController.email == null
                ? const LoginPage()
                : const MainPage();
          },
        ),

        /// Defines the named routes for the application.
        routes: {
          '/main': (context) => const MainPage(),
          '/home': (context) => const HomePage(),
          '/product-detail': (context) => ProductDetailPage(
                productId: ModalRoute.of(context)!.settings.arguments as int,
              ),
        },
      ),
    );
  }
}
