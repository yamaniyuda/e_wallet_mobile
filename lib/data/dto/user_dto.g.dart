// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      email: json['email'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      username: json['username'] as String?,
      profilePicture: json['profile_picture'] as String?,
      pin: json['pin'] as String?,
      balance: json['balance'] as int?,
      cardNumber: json['card_number'] as String?,
      token: json['token'] as String?,
      ktp: json['ktp'] as String?,
      tokenType: json['token_type'] as String?,
      tokenExpiresIn: json['token_expires_in'] as int?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'profile_picture': instance.profilePicture,
      'ktp': instance.ktp,
      'balance': instance.balance,
      'card_number': instance.cardNumber,
      'pin': instance.pin,
      'token': instance.token,
      'token_expires_in': instance.tokenExpiresIn,
      'token_type': instance.tokenType,
    };
