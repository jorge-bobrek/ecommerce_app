import 'package:fake_store_widgets_package/presentation/templates/register_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/features/authentication/presentation/providers/user_provider.dart';
import 'package:ecommerce_app/features/authentication/presentation/pages/login_page.dart';

/// A page for user registration.
///
/// The [RegisterPage] provides a form for users to register with name, last name, email, document and password.
/// After a successful registration, it navigates back to the previous screen and displays a success message.
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final documentController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    /// Handles the registration process.
    ///
    /// After a successful registration, navigates back and shows a success message.
    void handleRegister() {
      if (formKey.currentState!.validate()) {
        userProvider.register(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          document: documentController.text,
          password: passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }

    return RegisterTemplate(
      formKey: formKey,
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      emailController: emailController,
      documentController: documentController,
      passwordController: passwordController,
      confirmPasswordController: confirmPasswordController,
      onRegister: handleRegister,
    );
  }
}
