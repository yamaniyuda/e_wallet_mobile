import 'package:equatable/equatable.dart';

part 'auth_register_entity.g.dart';
part 'auth_login_entity.g.dart';

class AuthEntity extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();

  AuthLoginEntity authLoginEntity(AuthLoginEntity entity) {
    return entity;
  }

  AuthRegisterEntity authRegisterEntity(AuthRegisterEntity entity) {
    return entity;
  }
}