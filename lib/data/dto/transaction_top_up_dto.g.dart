// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_top_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionTopUpDTO _$TransactionTopUpDTOFromJson(Map<String, dynamic> json) =>
    TransactionTopUpDTO(
      token: json['token'] as String?,
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$TransactionTopUpDTOToJson(
        TransactionTopUpDTO instance) =>
    <String, dynamic>{
      'redirect_url': instance.redirectUrl,
      'token': instance.token,
    };
