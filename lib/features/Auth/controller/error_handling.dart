import 'dart:convert';

import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class ErrorHandler {
  static Future sendError(String error) async {
    http.Response response = await http.post(Uri.parse(api['debug']!),
        body: jsonEncode({'error': error}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
  }
}
