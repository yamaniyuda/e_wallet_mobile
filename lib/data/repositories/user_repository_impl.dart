import 'package:e_wallet_mobile/data/data_resource/local/auth_data_source.dart';
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
      late UserDTO? userDTO;

      userDTO = await AuthDataSource().getAuth();
      userDTO ??= await dataSource.fetchData();
      final UserEntity data = UserMapper().convert<UserDTO, UserEntity>(userDTO);
      return data;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> checkIsEmailExist(String email) async {
    try {
      final bool data = await dataSource.checkIsEmailExist(payload: email);
      return data;
    } catch (_) {
      return true;
    }
  }

  @override
  Future<List<UserEntity>> fetchDataByUsername(String username) async {
    try {
      final List<UserDTO> remoteData = await dataSource.fetchDataList(username);
      final List<UserEntity> data = List<UserEntity>.from(
        remoteData.map(
          (dto) => UserMapper().convert<UserDTO, UserEntity>(dto)
        )
      );
      return data;
    } catch (e) {
      return <UserEntity>[];
    }
  }
}