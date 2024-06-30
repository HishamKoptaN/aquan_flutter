import 'dart:convert';
import 'package:aquan/app/sign_up/auth_controller.dart';
import 'package:http/http.dart' as http;

class SubscribtionController {
  Future<Map<String, dynamic>> getUserLevelDetails() async {
    try {
      final response = await http.get(
        Uri.parse('https://dash.aquan.website/api/user/plan/1'),
        headers: await AuthController.getAuthHeaders(),
      );

      print('Response status: ${response.statusCode}'); // طباعة حالة الاستجابة
      print('Response body: ${response.body}'); // طباعة محتوى الاستجابة

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
