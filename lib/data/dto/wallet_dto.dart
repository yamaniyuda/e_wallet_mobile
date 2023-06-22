import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_dto.g.dart';

@JsonSerializable()
class WalletDTO implements DTO {
  @JsonKey(name: "balance")
  late int? balance;

  @JsonKey(name: "card_number")
  late String? cardNumber;

  WalletDTO({
    this.cardNumber,
    this.balance
  });

  factory WalletDTO.fromJson(Map<String, dynamic> json) {
    return _$WalletDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$WalletDTOToJson(this);
  }
}