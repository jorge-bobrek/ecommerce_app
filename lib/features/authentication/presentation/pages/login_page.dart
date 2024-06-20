import 'package:ecommerce_app/features/authentication/presentation/pages/register_page.dart';
import 'package:ecommerce_app/features/product/presentation/pages/main_page.dart';
import 'package:fake_store_widgets_package/presentation/templates/login_template.dart';
import 'package:flutter/material.dart';

/// A page for user login.
///
/// The [LoginPage] provides a form for users to log in with their email and password.
/// It also provides navigation to the registration page.
class LoginPage extends StatelessWidget {
  /// Creates an instance of [LoginPage].
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    /// Handles the login process.
    ///
    /// After a successful login, navigates to the [MainPage] and shows a success message.
    void handleLogin() {
      if (true) {
        try {
          //userProvider.login(emailController.text, passwordController.text);

          /// Navigates to the registration page.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text('Iniciaste sesión como: ${emailController.text}'),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email o contraseña inválidos'),
            ),
          );
        }
      }
    }

    return LoginTemplate(
      formKey: formKey,
      emailController: emailController,
      passwordController: passwordController,
      onLogin: handleLogin,
      onNavigation: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
      header: Image.asset(
        'assets/login_image.png',
        height: 250,
      ),
    );
  }
}
