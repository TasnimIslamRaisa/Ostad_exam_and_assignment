import 'package:shared_preferences/shared_preferences.dart';
class AuthController{
  static String? accesToken;
  final String _accesTokenKey = 'access-token';

  Future<void> saveAccessToken(String token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accesTokenKey, token);
    accesToken=token;
  }

  Future<String?> getAccessToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accesTokenKey);
    accesToken=token;
    return token;
  }

  Future<bool> isLoggedIn() async {
    return accesToken!=null;
  }
}