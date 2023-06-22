import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method_dto.g.dart';

@JsonSerializable()
class PaymentMethodDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "code")
  late String? code;

  @JsonKey(name: "thumbnail")
  late String? thumbnail;

  @JsonKey(name: "status")
  late String? status;

  PaymentMethodDTO({
    this.id,
    this.name,
    this.thumbnail,
    this.status,
    this.code
  });

  factory PaymentMethodDTO.fromJson(Map<String, dynamic> json) {
    return _$PaymentMethodDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentMethodDTOToJson(this);
  }

}