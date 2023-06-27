import 'package:e_wallet_mobile/data/repositories/auth_repository_impl.dart';
import 'package:e_wallet_mobile/data/repositories/user_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class GetCurrentUserUseCase extends UseCase<UserRepositoryImpl, String> {
  GetCurrentUserUseCase() : super(UserRepositoryImpl());

  @override
  Future<UserEntity?> call([String? params]) async {
    return await repository.fetchData();
  }
}