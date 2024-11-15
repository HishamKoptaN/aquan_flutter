import 'dart:convert';
import '../../../../core/database/api/routes.dart';
import 'package:http/http.dart' as http;

import '../../../Auth/sign_up/data/controller/sign_up_controller.dart';
import '../models/accounts_model.dart';

class AccountsRemoteDataSource {
  Future<List<Account>> getAccounts() async {
    http.Response response = await http.get(
      Uri.parse(routes['accounts']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    List<Account> accounts = await (jsonDecode(response.body)['accounts'])
        .map<Account>(
          (json) => Account.fromJson(
            json,
          ),
        )
        .toList();
    return accounts;
  }

  Future<List<Account>> updateAccounts({
    required List<Account> accountsInfo,
  }) async {
    final body = jsonEncode(
      {
        'accounts': accountsInfo
            .map(
              (account) => {
                'id': account.id,
                'account_number': account.accountNumber,
              },
            )
            .toList(),
      },
    );
    print(body);
    http.Response response = await http.patch(
      Uri.parse(routes['accounts']!),
      headers: await SignUpController.getAuthHeaders(),
      body: body,
    );
    final List<dynamic> accountsJson =
        await jsonDecode(response.body)['accounts'];
    List<Account> accounts = accountsJson.map(
      (json) {
        return Account.fromJson(json);
      },
    ).toList();
    return accounts;
  }
}
