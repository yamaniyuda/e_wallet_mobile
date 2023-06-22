import 'package:e_wallet_mobile/data/data_resource/remote/user_data_source.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/mappers/user_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(): super(UserDataSource());

  @override
  Future fetchData() async {
    try {
      final UserEntity data = UserMapper().convert<UserDTO, UserEntity>(
          await dataSource.fetchData()
      );
      return data;
    } catch (e) {
      return "Server Error.";
    }
  }

  @override
  Future<bool> checkIsEmailExist(String email) async {
    try {
      final bool data = await dataSource.checkIsEmailExist(payload: email);
      return data;
    } catch (_) {
      return false;
    }
  }
}