import 'dart:convert';

import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "email")
  late String? email;

  @JsonKey(name: "username")
  late String? username;

  @JsonKey(name: "profile_picture")
  late String? profilePicture;

  @JsonKey(name: "ktp")
  late String? ktp;

  @JsonKey(name: "balance")
  late int? balance;

  @JsonKey(name: "card_number")
  late String? cardNumber;

  @JsonKey(name: "pin")
  late String? pin;

  @JsonKey(name: "token")
  late String? token;

  @JsonKey(name: "token_expires_in")
  late int? tokenExpiresIn;

  @JsonKey(name: "token_type")
  late String? tokenType;

  UserDTO({
    this.email,
    this.name,
    this.id,
    this.username,
    this.profilePicture,
    this.pin,
    this.balance,
    this.cardNumber,
    this.token,
    this.ktp,
    this.tokenType,
    this.tokenExpiresIn
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return _$UserDTOFromJson(json);
  }

  factory UserDTO.deserialize(String json) {
    return UserDTO.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserDTOToJson(this);
  }

  String serialize() {
    return jsonEncode(toJson());
  }
}