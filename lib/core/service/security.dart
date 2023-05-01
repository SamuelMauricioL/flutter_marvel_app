import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_marvel_app/core/storage/secure_storage.dart';

class Security {
  /// {@macro security}
  Security({required this.storage});

  late final SecureStorage storage;

  Future<String> get _privateKey => storage.privateKey();
  Future<String> get publicKey => storage.publicKey();

  /// Gets timestamp and hash for that time and keys.
  Future<Map<String, String>> hashTimestamp() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final hash =
        generateMd5('$timestamp${await _privateKey}${await publicKey}');
    return <String, String>{
      'timestamp': '$timestamp',
      'hash': hash,
    };
  }

  /// Gets MD5 from an input.
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
