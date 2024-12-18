import 'dart:convert';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';
import 'package:http/http.dart' as http;

class SubscribtionController {
  Future<Map<String, dynamic>> getUserLevelDetails() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.aquan.website/app/user/plan/1'),
        headers: await SignUpController.getAuthHeaders(),
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
      print('Exception in controller: $e'); // طباعة الاستثناء
      return {'status': false, 'error': 'Exception: $e'};
    }
  }
}
