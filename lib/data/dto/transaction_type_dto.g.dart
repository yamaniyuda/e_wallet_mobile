// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionTypeDTO _$TransactionTypeDTOFromJson(Map<String, dynamic> json) =>
    TransactionTypeDTO(
      code: json['code'] as String?,
      thumbnail: json['thumbnail'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      action: json['action'] as String?,
    );

Map<String, dynamic> _$TransactionTypeDTOToJson(TransactionTypeDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'action': instance.action,
      'thumbnail': instance.thumbnail,
    };
