import 'package:e_wallet_mobile/data/repositories/user_repository_impl.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class CheckEmailUseCase extends UseCase<UserRepositoryImpl, String> {
  CheckEmailUseCase() : super(UserRepositoryImpl());

  @override
  Future call([String? params]) async {
    return await repository.checkIsEmailExist(params!);
  }
}