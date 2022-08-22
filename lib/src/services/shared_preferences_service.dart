import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  Future<bool> writeString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? text = prefs.getString(key);
    return text;
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
