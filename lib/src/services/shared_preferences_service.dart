import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  Future<void> write() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('title', 'Nao esquecer');
  }

  Future<void> read() async {
    final prefs = await SharedPreferences.getInstance();
    String title = prefs.getString('title') ?? '';
  }

  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('title');
  }
}
