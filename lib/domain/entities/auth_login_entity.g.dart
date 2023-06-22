part of 'auth_entity.dart';

class AuthLoginEntity {
  final String? email;
  final String? password;

  const AuthLoginEntity({ required this.email, required this.password });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password":  password
    };
  }
}