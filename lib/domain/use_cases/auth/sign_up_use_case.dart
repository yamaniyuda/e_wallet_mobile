import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/data/repositories/auth_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class SignUpUseCase extends UseCase<AuthRepositoryImpl, SignUpPayload> {

  SignUpUseCase() : super(AuthRepositoryImpl());

  @override
  Future<UserEntity?> call([SignUpPayload? params]) async {
    final result = await repository.signUp(params!);
    return result;
  }
}