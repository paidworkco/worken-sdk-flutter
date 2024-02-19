import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/models/secure_item.dart';

@LazySingleton()
class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<Option<dynamic>> writeSecureData(SecureItem item) async {
    try {
      await _secureStorage.write(key: item.id.name, value: item.value);
      return none();
    } catch (e) {
      return none(); //todo exception or failure
    }
  }

  Future<Option<String?>> readSecureData(SecuresId securesId) async {
    try {
      final result = await _secureStorage.read(key: securesId.name);

      return some((result != null && result.isNotEmpty) ? result : null);
    } catch (e) {
      return none(); //todo exception or failure
    }
  }
}
