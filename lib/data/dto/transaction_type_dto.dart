import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_type_dto.g.dart';

@JsonSerializable()
class TransactionTypeDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "code")
  late String? code;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "action")
  late String? action;

  @JsonKey(name: "thumbnail")
  late String? thumbnail;

  TransactionTypeDTO({
    this.code,
    this.thumbnail,
    this.name,
    this.id,
    this.action
  });

  factory TransactionTypeDTO.fromJson(Map<String, dynamic> json) {
    return _$TransactionTypeDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionTypeDTOToJson(this);
  }


}