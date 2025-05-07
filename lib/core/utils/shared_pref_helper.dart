import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._(); // private constructor as I don't want to allow creating an instance of this class itself.
  static const String _key = 'app_theme_key';

  static setTheme(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_key, isDark);
  }

  static getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
