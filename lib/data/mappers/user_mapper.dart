import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';

part 'user_mapper.g.dart';

@AutoMappr([
  MapType<UserDTO, UserEntity>(),
  MapType<UserEntity, UserDTO>(),
])
class UserMapper extends $UserMapper {}