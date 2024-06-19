import 'package:fake_store_widgets_package/fake_store_widgets_package.dart';
import 'package:flutter/material.dart';

/// A page for user registration.
///
/// The [RegisterPage] provides a form for users to register with an email and password.
/// After a successful registration, it navigates back to the previous screen and displays a success message.
class RegisterPage extends StatelessWidget {
  /// Creates an instance of [RegisterPage].
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterTemplate(
      title: 'Registro',

      /// Handles the registration process.
      ///
      /// After a successful registration, navigates back and shows a success message.
      onRegister: (email, password) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Registro exitoso'),
          ),
        );
      },
    );
  }
}
