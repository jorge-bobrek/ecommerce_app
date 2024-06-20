import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/features/authentication/presentation/providers/user_provider.dart';
import 'package:ecommerce_app/features/authentication/presentation/pages/login_page.dart';

/// A page that displays the user's account information and allows logging out.
///
/// The [AccountPage] shows the user's info and provides a button to log out.

class AccountPage extends StatelessWidget {
  /// Creates an instance of [AccountPage].
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Displays the user's info or placeholders if not available.
            LabelInfoWidget(
                label: 'Nombre', info: user?.firstName ?? 'No disponible'),
            LabelInfoWidget(
                label: 'Apellido', info: user?.lastName ?? 'No disponible'),
            LabelInfoWidget(
                label: 'Correo', info: user?.email ?? 'No disponible'),
            LabelInfoWidget(
                label: 'Documento', info: user?.document ?? 'No disponible'),
            const SizedBox(height: 20),
            /// Button to log out and navigate to the login page.
            ButtonWidget(
              label: 'Cerrar Sesión',
              onPressed: () {
                userProvider.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
