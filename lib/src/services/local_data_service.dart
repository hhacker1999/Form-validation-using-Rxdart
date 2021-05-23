import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalData {
  late SharedPreferences _prefs;
  LocalData() {
    SharedPreferences.getInstance().then((value) => this._prefs = value);
  }

  Future<void> create(String key, String map) async {
    await _prefs.setString(key, map);
  }

  Future<String> read(String key) async {
    var result = _prefs.getString(key);
    if (result != null)
      return result;
    else
      throw Exception();
  }

  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  Future<bool> containsKey(String key) async {
    return _prefs.containsKey(key);
  }
}
