import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_plan_dto.g.dart';

@JsonSerializable()
class DataPlanDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "operator_card_id")
  late int? operatorCardId;

  DataPlanDTO({
    this.id,
    this.name,
    this.operatorCardId
  });

  factory DataPlanDTO.fromJson(Map<String, dynamic> json) {
    return _$DataPlanDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DataPlanDTOToJson(this);
  }


}