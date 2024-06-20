import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

/// A provider for managing user authentication state.
///
/// The [UserProvider] handles user login and logout, and notifies listeners
/// when the authentication state changes.
class UserProvider extends ChangeNotifier {
  /// The currently logged-in user.
  User? _currentUser;

  /// The list of registered users.
  final List<User> _users = [
    User(
      firstName: 'Default',
      lastName: 'User',
      email: 'default@user.com',
      document: '123456789',
      password: 'password',
    ),
  ];

  /// Gets the currently logged-in user.
  User? get currentUser => _currentUser;

  /// Gets the list of registered users.
  List<User> get users => List.unmodifiable(_users);

  /// Logs in a user with the provided email and password.
  ///
  /// If the email and password match a registered user's credentials,
  /// the user is considered logged in.
  void login(String email, String password) {
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user;
      notifyListeners();
    } catch (e) {
      throw Exception('Invalid email or password');
    }
  }

  /// Logs out the current user.
  ///
  /// This method clears the user and notifies listeners about the change.
  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  /// Registers a new user with the provided details.
  ///
  /// This method creates a new [User] instance and adds it to the list of users.
  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String document,
    required String password,
  }) {
    final newUser = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      document: document,
      password: password,
    );
    _users.add(newUser);
    notifyListeners();
  }
}
