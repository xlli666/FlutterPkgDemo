import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static save(String key, value, {valType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (valType) {
      case bool:
        prefs.setBool(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case String:
        prefs.setString(key, value);
        break;
      case List:
        prefs.setStringList(key, value);
        break;
      default:
        prefs.setString(key, '${value??''}');
        break;
    }
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
