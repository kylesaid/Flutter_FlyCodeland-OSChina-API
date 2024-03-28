import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static SharedPreferences? prefs;

  static initSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  static save(String key, String value) {
    prefs?.setString(key, value);
  }

  static get(String key) {
    return prefs?.get(key);
  }

  static remove(String key) {
    prefs?.remove(key);
  }
}

//作者：浮华_du
//链接：https://juejin.cn/post/7030702503893139487
//来源：稀土掘金
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。