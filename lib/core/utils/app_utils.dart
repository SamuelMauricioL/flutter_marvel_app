import 'dart:convert';

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  static AppUtils get instance => _instance;

  dynamic getDataDecode(String body) {
    return json.decode(body);
  }
}
