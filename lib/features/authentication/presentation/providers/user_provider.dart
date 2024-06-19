import 'package:flutter/material.dart';

/// A provider for managing user authentication state.
///
/// The [UserProvider] handles user login and logout, and notifies listeners
/// when the authentication state changes.
class UserProvider extends ChangeNotifier {
  /// The email of the currently logged-in user.
  String? _email;

  /// Gets the email of the currently logged-in user.
  String? get email => _email;

  /// Logs in the user with the given [email] and [password].
  ///
  /// This method sets the user's email and notifies listeners about the change.
  void login(String email, String password) {
    _email = email;
    notifyListeners();
  }

  /// Logs out the current user.
  ///
  /// This method clears the user's email and notifies listeners about the change.
  void logout() {
    _email = null;
    notifyListeners();
  }
}
