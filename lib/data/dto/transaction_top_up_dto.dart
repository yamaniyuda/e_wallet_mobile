import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_top_up_dto.g.dart';

@JsonSerializable()
class TransactionTopUpDTO extends DTO {
  @JsonKey(name: "redirect_url")
  late String? redirectUrl;

  @JsonKey(name: "token")
  late String? token;

  TransactionTopUpDTO({
    this.token,
    this.redirectUrl
  });

  factory TransactionTopUpDTO.fromJson(Map<String, dynamic> json) {
    return _$TransactionTopUpDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionTopUpDTOToJson(this);
  }
}