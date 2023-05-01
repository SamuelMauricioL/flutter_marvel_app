import 'package:flutter_marvel_app/core/storage/storage_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  /// {@macro secure_storage}
  const SecureStorage({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  String get _publicKeyField => '__publicKeyField__';
  String get _privateKeyField => '__privateKeyField__';

  /// Gets publicKey from [SecureStorage].
  Future<String> publicKey() async {
    try {
      final value = await _secureStorage.read(key: _publicKeyField);
      if (value != null && value.isNotEmpty) {
        return value;
      }
      throw const ReadException('Empty publicKey');
    } on Exception catch (error, stackTrace) {
      throw ReadException(error, stackTrace);
    }
  }

  /// Gets privateKey from [SecureStorage].
  Future<String> privateKey() async {
    try {
      final value = await _secureStorage.read(key: _privateKeyField);
      if (value != null && value.isNotEmpty) {
        return value;
      }
      throw const ReadException('Empty privateKey');
    } on Exception catch (error, stackTrace) {
      throw ReadException(error, stackTrace);
    }
  }

  /// Save [privateKey] and [publicKey] into [SecureStorage].
  Future<void> saveCredentials({
    required String privateKey,
    required String publicKey,
  }) async {
    try {
      await _secureStorage.write(key: _publicKeyField, value: publicKey);
      await _secureStorage.write(key: _privateKeyField, value: privateKey);
    } on Exception catch (error, stackTrace) {
      throw WriteException(error, stackTrace);
    }
  }

  /// Clean all credentials at [SecureStorage].
  Future<void> clearCredentials() async {
    try {
      await _secureStorage.deleteAll();
    } on Exception catch (error, stackTrace) {
      throw WriteException(error, stackTrace);
    }
  }
}
