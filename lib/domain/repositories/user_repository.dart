import 'package:e_wallet_mobile/data/data_resource/remote/user_data_source.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class UserRepository extends Repository {
  final UserDataSource dataSource;

  UserRepository(this.dataSource);
  Future fetchData();
  Future checkIsEmailExist(String email);
}