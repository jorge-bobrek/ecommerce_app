import 'package:ecommerce_app/features/authentication/presentation/pages/login_page.dart';
import 'package:ecommerce_app/features/authentication/presentation/providers/user_provider.dart';
import 'package:fake_store_widgets_package/presentation/atoms/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page that displays the user's account information and allows logging out.
///
/// The [AccountPage] shows the user's email and provides a button to log out.
class AccountPage extends StatelessWidget {
  /// Creates an instance of [AccountPage].
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
            /// Displays the user's email or a placeholder if not available.
            TextWidget(
                text: 'Email: ${userProvider.email ?? 'No disponible'}',
                size: 18),
            const SizedBox(height: 20),
            
            /// Button to log out and navigate to the login page.
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
