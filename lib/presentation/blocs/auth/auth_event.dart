part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// For check email when sign up
class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

/// For SignUp new user
class AuthRegister extends AuthEvent  {
  final SignUpPayload data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

/// For SignIn user
class AuthLogin extends AuthEvent  {
  final SignInPayload data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

/// Get Current User
class AuthGetCurrentUser extends AuthEvent {}

// class AuthUpdateUser extends AuthEvent {
//   final UserUpdateFormModel data;
//   const AuthUpdateUser(this.data);
//
//   @override
//   List<Object> get props => [data];
// }

/// For update pin
class AuthUpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;

  const AuthUpdatePin({
    required this.oldPin,
    required this.newPin
  });

  @override
  List<Object> get props => [oldPin, newPin];
}

/// For logout
class AuthLogout extends AuthEvent {}

/// For update balance
class AuthUpdateBalance extends AuthEvent {
  final int amount;
  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}