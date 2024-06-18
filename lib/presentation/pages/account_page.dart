import 'package:ecommerce_app/presentation/pages/login_page.dart';
import 'package:ecommerce_app/presentation/providers/user_provider.dart';
import 'package:fake_store_widgets_package/presentation/atoms/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: 'Email: ${userProvider.email ?? 'No disponible'}',
                size: 18),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userProvider.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
