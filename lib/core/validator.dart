import '../all_imports.dart';

class Validator {
  static String? validatePhoneNum({
    required String? value,
    required AppLocalizations t,
  }) {
    final sanitizedValue = value?.replaceAll(' ', '') ?? '';
    if (sanitizedValue.isEmpty) {
      return t.required;
    }
    if (!RegExp(r'^\d+$').hasMatch(sanitizedValue)) {
      return t.the_number_must_contain_only_numbers;
    }
    if (sanitizedValue.length < 7) {
      return t.number_must_be_more_than_6_digits;
    }
    return null;
  }

  static String? customValidator({
    required String value,
    required AppLocalizations t,
  }) {
    if (value.isEmpty) {
      return t.required;
    }
    return null;
  }

  static String? emailValidator({
    required String value,
    required AppLocalizations t,
  }) {
    if (value.isEmpty) {
      return t.required;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(
      value,
    )) {
      return t.invalid_email;
    }
    return null;
  }
}
