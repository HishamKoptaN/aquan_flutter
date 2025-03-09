import '../../all_imports.dart';

class PasswordValidator {
  static bool hasUppercase = false;
  static bool hasDigits = false;
  static bool hasMinLength = false;
  static bool hasSymbols = false;

  static String? validatePassword({
    required String value,
    required AppLocalizations t,
  }) {
    String? passwordStrength;
    int strength = 0;
    hasUppercase = value.contains(RegExp(r'[A-Z]'));
    hasDigits = value.contains(RegExp(r'[0-9]'));
    hasMinLength = value.length > 7;
    hasSymbols = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (hasUppercase) strength++;
    if (hasDigits) strength++;
    if (hasMinLength) strength++;
    if (hasSymbols) strength++;
    if (strength == 4) {
      passwordStrength = 'قوية جدًا';
    } else if (strength == 3) {
      passwordStrength = 'قوية';
    } else if (strength == 2) {
      passwordStrength = 'متوسطة';
    } else if (strength == 1) {
      passwordStrength = 'ضعيفة';
    } else {
      passwordStrength = 'ضعيفة جدًا';
    }
    return passwordStrength;
  }

  static String? confirmationPasswordValidator({
    required String value,
    required String password,
    required AppLocalizations t,
  }) {
    if (value.isEmpty) {
      return t.required;
    } else if (value != password) {
      return t.password_mis_match;
    }
    return null;
  }
}
