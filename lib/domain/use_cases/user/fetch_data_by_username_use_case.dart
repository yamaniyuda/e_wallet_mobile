import 'package:e_wallet_mobile/data/repositories/user_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/user_repository.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class FetchDataByUsername extends UseCase<UserRepository, String> {
  FetchDataByUsername() : super(UserRepositoryImpl());

  @override
  Future<List<UserEntity>> call([String? params]) async {
    return await repository.fetchDataByUsername(params!);
  }
}