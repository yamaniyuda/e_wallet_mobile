// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDTO _$TransactionDTOFromJson(Map<String, dynamic> json) =>
    TransactionDTO(
      id: json['id'] as int?,
      amount: json['amount'] as int?,
      createdAt: TransactionDTO._fromJson(json['created_at'] as String),
    )..paymentMethod = json['payment_method'] == null
        ? null
        : PaymentMethodDTO.fromJson(
            json['payment_method'] as Map<String, dynamic>);

Map<String, dynamic> _$TransactionDTOToJson(TransactionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'created_at': instance.createdAt?.toIso8601String(),
      'payment_method': instance.paymentMethod,
    };
