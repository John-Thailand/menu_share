import 'package:email_validator/email_validator.dart';

/// Validator
String? emailValidator(String? email) {
  if (email == null || email.trim().isEmpty) {
    return 'Please enter some text';
  }
  if (!EmailValidator.validate(email)) {
    return 'Please enter mail address';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.trim().isEmpty) {
    return 'Please enter some text';
  }
  if (6 > password.length || password.length > 12) {
    return 'Please enter 6 to 12 characters';
  }
  return null;
}

String? confirmValidator(String password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.trim().isEmpty) {
    return 'Please enter some text';
  }
  if (password != confirmPassword) {
    return 'This password does not match the password';
  }
  return null;
}
