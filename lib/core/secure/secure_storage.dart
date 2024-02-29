import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

enum SecuresId { none }

class SecureItem extends Equatable {
  final SecuresId id;
  final String value;

  const SecureItem({required this.id, required this.value});

  @override
  List<Object> get props => [id, value];
}

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
