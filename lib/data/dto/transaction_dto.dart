import 'package:e_wallet_mobile/data/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';

part 'transaction_dto.g.dart';

@JsonSerializable()
class TransactionDTO implements DTO {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "amount")
  late int? amount;

  @JsonKey(name: "created_at", fromJson: _fromJson)
  late DateTime? createdAt;

  @JsonKey(name: "payment_method")
  late PaymentMethodDTO? paymentMethod;

  TransactionDTO({
    this.id,
    this.amount,
    this.createdAt
  });

  static DateTime? _fromJson(String value) {
    return DateTime.tryParse(value);
  }

  factory TransactionDTO.fromJson(Map<String, dynamic> json) {
    return _$TransactionDTOFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionDTOToJson(this);
  }
}