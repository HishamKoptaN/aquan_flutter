// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:aquan/app/accounts/model/accounts_model.dart';
// import 'package:aquan/app/Auth/sign_up/controller/sign_up_controller.dart';

// import '../../../../Helpers/routes.dart';
// import '../../../Auth/sign_up/controller/sign_up_controller.dart';

// class AccountsRemoteDataSource {
//   Future<Map<String, dynamic>> getAccounts() async {
//     http.Response response = await http.get(
//       Uri.parse(api['accounts']!),
//       headers: await SignUpController.getAuthHeaders(),
//     );
//     return jsonDecode(response.body);
//   }

//   Future<Map<String, dynamic>> updateAccounts({
//     required List<Account> accounts,
//   }) async {
//     final List<Map<String, dynamic>> accountsInfo =
//         accounts.map((account) => account.toJson()).toList();

//     http.Response response = await http.patch(
//       Uri.parse(api['accounts']!),
//       body: jsonEncode({'accounts': accountsInfo}),
//       headers: await SignUpController.getAuthHeaders(),
//     );
//     return jsonDecode(response.body);
//   }
// }
