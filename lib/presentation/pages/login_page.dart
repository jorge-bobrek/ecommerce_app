import 'package:ecommerce_app/presentation/pages/register_page.dart';
import 'package:ecommerce_app/presentation/providers/user_provider.dart';
import 'package:fake_store_widgets_package/presentation/templates/login_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
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
      onLogin: (email, password) {
        userProvider.login(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(seconds: 1),
              content: Text('Iniciaste sesión como: $email')),
        );
      },
      registerNavigation: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
    );
  }
}
