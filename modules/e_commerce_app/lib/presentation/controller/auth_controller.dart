import 'package:shared_preferences/shared_preferences.dart';
class AuthController{
  static String? accessToken;
  final String _accessTokenKey = 'access-token';

  Future<void> saveAccessToken(String token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken=token;
    print('Token saved: $token');
  }

  Future<String?> getAccessToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken=token;
    print('Token retrieved from SharedPreferences: $token');
    return token;
  }

  Future<bool> isLoggedIn() async {
    return accessToken!=null;
  }
  Future<void> clearUserData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}