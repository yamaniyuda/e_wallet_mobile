import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tip_dto.g.dart';

@JsonSerializable()
class TipDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "title")
  late String? title;

  @JsonKey(name: "url")
  late String? url;

  @JsonKey(name: "thumbnail")
  late String? thumbnail;

  TipDTO({
    this.id,
    this.thumbnail,
    this.title,
    this.url
  });

  factory TipDTO.fromJson(Map<String, dynamic> json) {
    return _$TipDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TipDTOToJson(this);
  }
}