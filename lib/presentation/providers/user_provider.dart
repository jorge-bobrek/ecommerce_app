import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _email;

  String? get email => _email;

  void login(String email, String password) {
    _email = email;
    notifyListeners();
  }

  void logout() {
    _email = null;
    notifyListeners();
  }
}
