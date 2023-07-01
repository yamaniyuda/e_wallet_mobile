import 'package:e_wallet_mobile/data/dto/data_plan_dto.dart';
import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'operator_card_dto.g.dart';

@JsonSerializable()
class OperatorCardDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "status")
  late String? status;

  @JsonKey(name: "thumbnail")
  late String? thumbnail;

  @JsonKey(name: "data_plans")
  late List<DataPlanDTO>? dataPlans;

  OperatorCardDTO({
    this.id,
    this.name,
    this.thumbnail,
    this.status,
    this.dataPlans
  });

  factory OperatorCardDTO.fromJson(Map<String, dynamic> json) {
    return _$OperatorCardDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$OperatorCardDTOToJson(this);
  }
}