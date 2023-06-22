part of 'auth_entity.dart';

class AuthRegisterEntity {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  const AuthRegisterEntity({
    this.name,
    this.email,
    this.password,
    this.ktp,
    this.pin,
    this.profilePicture
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "pin": pin,
      "profile_picture": profilePicture,
      "ktp": ktp
    };
  }

  AuthRegisterEntity copyWith({
    final String? name,
    final String? email,
    final String? password,
    final String? pin,
    final String? profilePicture,
    final String? ktp
  }) {
    return AuthRegisterEntity(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        ktp: ktp ?? this.ktp,
        profilePicture: profilePicture ?? this.profilePicture
    );
  }
}