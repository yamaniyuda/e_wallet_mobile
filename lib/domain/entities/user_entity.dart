import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  late int? id;
  late String? name;
  late String? email;
  late String? username;
  late String? profilePicture;
  late String? ktp;
  late int? balance;
  late String? cardNumber;
  late String? pin;
  late String? token;
  late String? password;
  late int? tokenExpiresIn;
  late String? tokenType;
  late int? verified;

  UserEntity({
    this.email,
    this.name,
    this.id,
    this.password,
    this.username,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.tokenExpiresIn,
    this.tokenType,
    this.ktp,
    this.token,
    this.pin,
    this.verified
  });

  @override
  List<Object?> get props => [
    id,
    email,
    name,
    username,
    profilePicture,
    balance,
    cardNumber,
    tokenExpiresIn,
    tokenType,
    ktp,
    tokenType,
    pin,
    password,
    verified
  ];

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    String? profilePicture,
    String? ktp,
    int? balance,
    String? cardNumber,
    String? pin,
    String? password,
    String? token,
    int? tokenExpiresIn,
    String? tokenType,
  }) {
    return UserEntity(
      id: id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      pin: pin ?? this.pin,
      balance: balance ?? this.balance,
      verified: verified,
      profilePicture: profilePicture,
      token: token,
      cardNumber: cardNumber
    );
  }
}