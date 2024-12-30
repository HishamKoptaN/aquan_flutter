import 'package:intl/intl.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

final NumberFormat formatter = NumberFormat('#,##0');
Future<String?> getLocale() async {
  return await SharedPrefHelper.getString(
        key: SharedPrefKeys.languageCode,
      ) ??
      'ar';
}

int? getIntValueFromFormatingString({
  required String input,
}) {
  if (input.isEmpty) {
    return 0;
  }
  return int.parse(input.replaceAll(',', ''));
}
