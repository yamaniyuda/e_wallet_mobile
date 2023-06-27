part of 'auth_bloc.dart';

/// abstract class
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// for first init
class AuthInitial extends AuthState {}

/// state when get another state
class AuthLoading extends AuthState {}

/// state for error handling
class AuthFailed extends AuthState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => [e];
}

/// state for check email exist or not
class AuthCheckEmailSuccess extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}