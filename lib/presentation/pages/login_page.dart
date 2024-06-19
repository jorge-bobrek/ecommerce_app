import 'package:ecommerce_app/presentation/pages/register_page.dart';
import 'package:ecommerce_app/presentation/providers/user_provider.dart';
import 'package:fake_store_widgets_package/presentation/templates/login_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

/// A page for user login.
///
/// The [LoginPage] provides a form for users to log in with their email and password.
/// It also provides navigation to the registration page.
class LoginPage extends StatefulWidget {
  /// Creates an instance of [LoginPage].
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return LoginTemplate(
      title: 'Iniciar Sesión',

      /// Handles the login process.
      ///
      /// After a successful login, navigates to the [MainPage] and shows a success message.
      onLogin: (email, password) {
        userProvider.login(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text('Iniciaste sesión como: $email'),
          ),
        );
      },

      /// Navigates to the registration page.
      registerNavigation: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
    );
  }
}
