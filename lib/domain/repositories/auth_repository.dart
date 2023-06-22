import 'package:e_wallet_mobile/data/data_resource/remote/auth_data_source.dart' as remote;
import 'package:e_wallet_mobile/data/data_resource/local/auth_data_source.dart' as local;
import 'package:e_wallet_mobile/data/mappers/user_mapper.dart';
import 'package:e_wallet_mobile/data/payloads/sign_in_payload.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class AuthRepository extends Repository {
  final remote.AuthDataSource remoteDataSource;
  final local.AuthDataSource localDataSource;
  final UserMapper mapper;

  AuthRepository({ required this.remoteDataSource, required this.localDataSource, required this.mapper });
  Future signIn(SignInPayload payload);
  Future signUp(SignUpPayload payload);
  Future logout();
  Future getToken();
}