import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_history_dto.g.dart';

@JsonSerializable()
class TransferHistoryDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "username")
  late String? username;

  @JsonKey(name: "verified")
  late String? verified;

  @JsonKey(name: "profile_picture")
  late String? profilePicture;

  TransferHistoryDTO({
    this.name,
    this.id,
    this.profilePicture,
    this.username,
    this.verified
  });

  factory TransferHistoryDTO.fromJson(Map<String, dynamic> json) {
    return _$TransferHistoryDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransferHistoryDTOToJson(this);
  }


}