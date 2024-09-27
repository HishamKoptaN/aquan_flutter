import 'dart:convert';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/api/routes.dart';
import '../../../Auth/sign_up/controller/sign_up_controller.dart';
import '../../domain/entities/account.dart';
import '../models/accounts_model.dart';
import 'package:http/http.dart' as http;

class AccountsRemoteDataSource {
  final ApiConsumer api;
  AccountsRemoteDataSource({required this.api});
  Future<List<AccountModel>> getAccounts() async {
    http.Response response = await http.get(
      Uri.parse(routes['accounts']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    List<AccountModel> accounts = await (jsonDecode(response.body)['accounts'])
        .map<AccountModel>((json) => AccountModel.fromJson(json))
        .toList();
    return accounts;
  }

  Future<List<AccountModel>> updateAccounts({
    required List<AccountEntity> accountsInfo,
  }) async {
    http.Response response = await http.patch(
      Uri.parse(routes['accounts']!),
      headers: await SignUpController.getAuthHeaders(),
      body: jsonEncode(accountsInfo),
    );
    List<AccountModel> accounts = await (jsonDecode(response.body)['accounts'])
        .map(
          (json) => AccountModel.fromJson(
            json,
          ),
        )
        .toList();
    return accounts;
  }
}
