import 'package:get_storage/get_storage.dart';

class Storage {
  Storage._internal();
  static final Storage _instance = Storage._internal();
  static Storage get instance => _instance;

  final GetStorage _getStorage = GetStorage();

  static Future<void> init() async {
    await GetStorage.init('Storage');
  }

  Future<void> write(String key, String value) async {
    await _getStorage.write(key, value);
  }

  Future<String?> read(String key) {
    return Future.value(_getStorage.read(key));
  }

  Future<bool> hasKey(String key) {
    return Future.value(_getStorage.hasData(key));
  }

  Future clear() async {
    await _getStorage.erase();
  }

  Future removeKey(String key) async {
    await _getStorage.remove(key);
  }
}
