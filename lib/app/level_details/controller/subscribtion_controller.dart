import 'dart:convert';
import 'package:aquan/app/sign_up/auth_controller.dart';
import 'package:http/http.dart' as http;

class SubscribtionController {
  Future<Map<String, dynamic>> getUserLevelDetails(int userID) async {
    try {
      final response = await http.get(
        Uri.parse('https://dash.aquan.website/api/user/plan/$userID'),
        headers: await AuthController.getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'status': false,
          'error':
              'Failed to load data: ${response.statusCode} - ${response.reasonPhrase}'
        };
      }
    } catch (e) {
      return {'status': false, 'error': 'Exception: $e'};
    }
  }
}
