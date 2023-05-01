import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_marvel_app/core/storage/secure_storage.dart';

Future<void> setDefaultCredentials(SecureStorage secureStorage) async {
  await dotenv.load();

  String? privateKey;
  String? publicKey;

  try {
    privateKey = await secureStorage.privateKey();
    publicKey = await secureStorage.publicKey();
  } catch (e) {
    privateKey = dotenv.get('PRIVATE_KEY', fallback: 'PRIVATE_KEY not found');
    publicKey = dotenv.get('PUBLIC_KEY', fallback: 'PUBLIC_KEY not found');
  }

  await secureStorage.saveCredentials(
    privateKey: privateKey,
    publicKey: publicKey,
  );
}
