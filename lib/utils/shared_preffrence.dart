import 'package:shared_preferences/shared_preferences.dart';

String keyLogin = 'login';

class Preffrence {
  Future<bool> setValue(String value) async {
    SharedPreferences mypref = await SharedPreferences.getInstance();
    return mypref.setString(keyLogin, value);
  }

  Future<String> getToken() async {
    SharedPreferences mypref = await SharedPreferences.getInstance();
    return mypref.getString(keyLogin) ?? 'NA';
  }

  Future<bool> logout() async {
    SharedPreferences mypref = await SharedPreferences.getInstance();
    return mypref.clear();
  }
}
