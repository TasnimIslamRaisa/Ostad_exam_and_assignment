import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';

class AuthController{
  static String accesstokenkey='access-token';
  static const String userDatakey='user-data';
   static String accessToken="";
 static Future<void> saveUserAccessToken(String token) async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  await sharedPreferences.setString(accesstokenkey,token);
  accesstokenkey=token;
}
static Future<String?> getUserAccessToken()async{
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   return sharedPreferences.getString(accesstokenkey);
}
  static Future<void> saveUserdata(UserModel user)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(userDatakey,jsonEncode(user.toJson()));
  }
  static Future<UserModel?> getUserData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? data =sharedPreferences.getString(userDatakey);
    if(data==null){
      return null;
    }
    UserModel userModel=UserModel.fromJson(jsonDecode(data));
    return userModel;
  }
}