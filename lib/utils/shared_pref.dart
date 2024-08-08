
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref();

  static const String email = "email";

  setEmail(String value) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString(email, value);
  }

  Future<String?> getEmail() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(email);
  }
}
