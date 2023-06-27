import 'package:e_wallet_mobile/data/data_resource/local/auth_data_source.dart' as local;
import 'package:e_wallet_mobile/data/data_resource/remote/auth_data_source.dart' as remote;
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/mappers/user_mapper.dart';
import 'package:e_wallet_mobile/data/payloads/sign_in_payload.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl()
    : super(
      localDataSource: local.AuthDataSource(),
      mapper: UserMapper(),
      remoteDataSource: remote.AuthDataSource()
    );

  @override
  Future<bool> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.deleteAuth();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<UserEntity?> signIn(SignInPayload payload) async {
    try {
      final UserDTO data = await remoteDataSource.login(payload: payload);
      await localDataSource.storeAuth(data);
      return mapper.convert<UserDTO, UserEntity>(data);
    } catch (e, p) {
      return null;
    }
  }

  @override
  Future<UserEntity?> signUp(SignUpPayload payload) async {
    try {
      final UserDTO data = await remoteDataSource.register(payload: payload);
      await localDataSource.storeAuth(data);
      return mapper.convert<UserDTO, UserEntity>(data);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String> getToken() async {
    final String token = await localDataSource.getToken();
    return token;
  }
}