import 'package:shared_preferences/shared_preferences.dart';

abstract class SignInUpLocalDataDataSource {
  //skip
  Future<void> skip({required bool value});
  Future<bool> getSkip();
  //stayLogin
  Future<void> stayLogin({required bool value});
  Future<bool> getStayLogin();
  Future<void> removeStayLogin();
  // methode for token
  Future<void> saveToken({required String token});
  Future<String?> getToken();
  Future<void> removeToken();
}

class SignInUpLocalDataDataSourceImpl extends SignInUpLocalDataDataSource {
  final SharedPreferences sharedPreferences;
  static const String _tokenKey = 'login_token';
  static const String _skipKey = 'skip_login';
  static const String _keepLoginKey = 'keep_login';

  SignInUpLocalDataDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> getSkip() async {
    return sharedPreferences.getBool(_skipKey) ?? false;
  }

  @override
  Future<bool> getStayLogin() async {
    return sharedPreferences.getBool(_keepLoginKey) ?? false;
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(_tokenKey);
  }

  @override
  Future<void> removeStayLogin() async {
    await sharedPreferences.remove(_keepLoginKey);
  }

  @override
  Future<void> removeToken() async {
    await sharedPreferences.remove(_tokenKey);
  }

  @override
  Future<void> saveToken({required String token}) async {
    await sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<void> skip({required bool value}) async {
    await sharedPreferences.setBool(_skipKey, value);
  }

  @override
  Future<void> stayLogin({required bool value}) async {
    await sharedPreferences.setBool(_keepLoginKey, value);
  }
}
