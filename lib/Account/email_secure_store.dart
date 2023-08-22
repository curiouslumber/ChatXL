import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EmailSecureStore {
  static const String _storageUserEmailAddressKey = 'userEmailAddress';
  final FlutterSecureStorage _secureStorage;

  const EmailSecureStore(this._secureStorage);

  Future<String?> getEmail() =>
      _secureStorage.read(key: _storageUserEmailAddressKey);

  Future<void> setEmail(String email) => _secureStorage.write(
        key: _storageUserEmailAddressKey,
        value: email,
      );
}
