import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';
import 'package:e_wallet_mobile/data/repositories/user_repository_impl.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class SignUpUseCase extends UseCase<UserRepositoryImpl, SignUpPayload> {

  SignUpUseCase() : super(UserRepositoryImpl());

  @override
  Future call([SignUpPayload? params]) async {
    final result = repository.fetchData();
    return result;
  }
}