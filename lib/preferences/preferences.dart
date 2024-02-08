import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String correu = '';
  static String contrasenya = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get email {
    return _prefs.getString('correu') ?? '';
  }

  static set email(String value) {
    _prefs.setString('correu', value);
  }

  static String get password {
    return _prefs.getString('contrasenya') ?? '';
  }

  static set password(String value) {
    _prefs.setString('contrasenya', value);
  }
}
