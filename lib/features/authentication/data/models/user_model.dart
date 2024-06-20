/// A model class representing a user in the application.
class User {
  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The email address of the user.
  final String email;

  /// The document ID of the user.
  final String document;

  /// The password of the user.
  final String password;

  /// Creates a new [User] instance.
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.document,
    required this.password,
  });
}