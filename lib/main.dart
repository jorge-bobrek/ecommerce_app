import 'package:ecommerce_app/presentation/pages/home_page.dart';
import 'package:ecommerce_app/presentation/pages/login_page.dart';
import 'package:ecommerce_app/presentation/pages/main_page.dart';
import 'package:ecommerce_app/presentation/providers/cart_provider.dart';
import 'package:ecommerce_app/presentation/providers/product_provider.dart';
import 'package:ecommerce_app/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/presentation/providers/user_provider.dart';
import 'package:fake_store_api_package/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
            catalog: Catalog(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Los Recuerdos De Ella',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<UserProvider>(
          builder: (context, userController, _) {
            return userController.email == null
                ? const LoginPage()
                : const MainPage();
          },
        ),
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
