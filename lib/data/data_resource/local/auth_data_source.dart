import 'package:e_wallet_mobile/data/data_resource/local/local_data_source.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';

class AuthDataSource extends LocalDataSource {
  final String _keyAuth = "auth_user";

  Future<UserDTO> storeAuth(UserDTO data) async {
    await storage.write(
      key: _keyAuth,
      value: data.serialize(),
      aOptions: getAndroidOptions(),
      iOptions: getIosOptions()
    );

    final String? dataLocal = await storage.read(
      key: _keyAuth,
      aOptions: getAndroidOptions(),
      iOptions: getIosOptions()
    );
    final UserDTO dataStore = UserDTO.deserialize(dataLocal!);

    return dataStore;
  }

  Future<void> deleteAuth() async {
    await storage.delete(key: _keyAuth);
  }

  Future<UserDTO> update(UserDTO data) async {
    deleteAuth();
    return storeAuth(data);
  }

  Future<UserDTO?> getAuth() async {
    try {
      final String? dataLocal = await storage.read(
        key: _keyAuth,
        aOptions: getAndroidOptions(),
        iOptions: getIosOptions()
      );
      final UserDTO dataStore = UserDTO.deserialize(dataLocal!);

      return dataStore;
    } catch (_) {
      return null;
    }
  }

  Future<String> getToken() async {
    final UserDTO? data = await getAuth();
    return "Bearer ${data?.token}";
  }
}