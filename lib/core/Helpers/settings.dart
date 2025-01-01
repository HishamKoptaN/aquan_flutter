import 'package:aquan/all_imports.dart';
import 'package:http/http.dart' as http;

class Settings {
  static Future setup() async {
    http.Response response = await http.post(Uri.parse(routes['settings']));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status']) {
        Map<String, dynamic> settings = data['settings'];
// facebook_link, instagram_link, whatsapp_link, about_us_link, app_link
        List s = [
          'facebook_link',
          'instagram_link',
          'whatsapp_link',
          'about_us_link',
          'app_link'
        ];
        settings.forEach((key, value) {
          if (value is String && s.contains(key)) {
            prefs.setString(key, value);
          }
        });
      }
    }
  }
}
