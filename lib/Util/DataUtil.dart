import 'package:shared_preferences/shared_preferences.dart';

class DataUtil{
  static const String SP_ACCESS_TOKEN = 'access_token';
  static const String SP_REFRESH_TOKEN = 'refresh_token';
  static const String SP_UID = 'uid';
  static const String SP_TOKEN_TYPE = 'token_type';
  static const String SP_EXPIRES_IN = 'expires_in';
  static const String SP_IS_LOGIN = 'is_login';

  static Future<void> saveLoginInfo(Map<String, dynamic>map) async {
    if (map != null && map.isNotEmpty) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref
        ..setString(SP_ACCESS_TOKEN, map[SP_ACCESS_TOKEN])
        ..setString(SP_REFRESH_TOKEN, map[SP_REFRESH_TOKEN])
        ..setInt(SP_UID, map[SP_UID])
        ..setString(SP_TOKEN_TYPE, map[SP_TOKEN_TYPE])
        ..setInt(SP_EXPIRES_IN, map[SP_EXPIRES_IN])
        ..setBool(SP_IS_LOGIN, true);
    }
  }

  static Future<void> clearLoginInfo() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref
      ..setString(SP_ACCESS_TOKEN, '')
      ..setString(SP_REFRESH_TOKEN, '')
      ..setInt(SP_UID, -1)
      ..setString(SP_TOKEN_TYPE, '')
      ..setInt(SP_EXPIRES_IN, -1)
      ..setBool(SP_IS_LOGIN, false);
  }

  static Future<bool> isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final isLogin = pref.getBool(SP_IS_LOGIN);
    return isLogin != null && isLogin;
  }

  static Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(SP_ACCESS_TOKEN) ?? '';
  }



}
