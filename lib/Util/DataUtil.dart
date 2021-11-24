import 'package:flycodeland/Models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUtil{
  static const String SP_ACCESS_TOKEN = 'access_token';
  static const String SP_REFRESH_TOKEN = 'refresh_token';
  static const String SP_UID = 'uid';
  static const String SP_TOKEN_TYPE = 'token_type';
  static const String SP_EXPIRES_IN = 'expires_in';
  static const String SP_IS_LOGIN = 'is_login';


  //用户信息字段
  static const String SP_USER_GENDER = 'gender';
  static const String SP_USER_NAME = 'name';
  static const String SP_USER_LOCATION = 'location';
  static const String SP_USER_ID = 'id';
  static const String SP_USER_AVATAR = 'avatar';
  static const String SP_USER_EMAIL = 'email';
  static const String SP_USER_URL = 'url';

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

  //{"gender":"male","name":"Damon2019","location":"湖南 长沙","id":2006874,"avatar":"https://oscimg.oschina.net/oscnet/up-21zvuaor7bbvi8h2a4g93iv9vve2wrnz.jpg!/both/50x50?t=1554975223000","email":"3262663349@qq.com","url":"https://my.oschina.net/damon007"}
  static saveUserInfo(Map<String, dynamic> map) async {
    if (map != null && map.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String gender = map[SP_USER_GENDER];
      String name = map[SP_USER_NAME];
      String location = map[SP_USER_LOCATION];
      int id = map[SP_USER_ID];
      String avatar = map[SP_USER_AVATAR];
      String email = map[SP_USER_EMAIL];
      String url = map[SP_USER_URL];

      sp
        ..setString(SP_USER_GENDER, gender)
        ..setString(SP_USER_NAME, name)
        ..setString(SP_USER_LOCATION, location)
        ..setInt(SP_USER_ID, id)
        ..setString(SP_USER_AVATAR, avatar)
        ..setString(SP_USER_EMAIL, email)
        ..setString(SP_USER_URL, url);

      User user = new User(
          id: id,
          name: name,
          gender: gender,
          avator: avatar,
          email: email,
          location: location,
          url: url);
      return user;
    }
    return null;
  }

  //获取用户信息
  static Future<User?> getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool(SP_IS_LOGIN) ?? false;
    if (isLogin == null || !isLogin) {
      return null;
    }
    User user = new User(
      gender: sp.getString(SP_USER_GENDER) ?? '',
      name: sp.getString(SP_USER_NAME) ?? '',
      location: sp.getString(SP_USER_LOCATION) ?? '',
      id: sp.getInt(SP_USER_ID) ?? -1,
      avator: sp.getString(SP_USER_AVATAR) ?? '',
      email: sp.getString(SP_USER_EMAIL) ?? '',
      url: sp.getString(SP_USER_URL) ?? '',
    );
    return user;
  }

}
