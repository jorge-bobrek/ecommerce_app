/// A model class representing a user in the application.
class UserModel {
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

  /// Creates a new [UserModel] instance.
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.document,
    required this.password,
  });
}