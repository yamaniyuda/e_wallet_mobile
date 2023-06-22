// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletDTO _$WalletDTOFromJson(Map<String, dynamic> json) => WalletDTO(
      cardNumber: json['card_number'] as String?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$WalletDTOToJson(WalletDTO instance) => <String, dynamic>{
      'balance': instance.balance,
      'card_number': instance.cardNumber,
    };
