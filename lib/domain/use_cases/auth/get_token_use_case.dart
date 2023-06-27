import 'package:e_wallet_mobile/data/repositories/auth_repository_impl.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class GetTokenUseCase extends UseCase<AuthRepositoryImpl, String> {
  GetTokenUseCase() : super(AuthRepositoryImpl());

  @override
  Future<String> call([String? params]) {
    return repository.getToken();
  }
}