import 'dart:convert';
import 'dart:typed_data';

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  static AppUtils get instance => _instance;

  dynamic getDataDecode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }
}