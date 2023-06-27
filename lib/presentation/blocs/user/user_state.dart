part of 'user_bloc.dart';

/// abstract class
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

/// for first init state
class UserInitial extends UserState {}

/// for loading state
class UserLoading extends UserState {}

/// for error handling
class UserFailed extends UserState {
  final String e;
  const UserFailed(this.e);

  @override
  List<Object?> get props => [e];
}

/// state when state success
class UserSuccess extends UserState {
  final List<UserEntity> users;
  const UserSuccess(this.users);

  @override
  List<Object?> get props => [users];
}