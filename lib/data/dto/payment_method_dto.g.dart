// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodDTO _$PaymentMethodDTOFromJson(Map<String, dynamic> json) =>
    PaymentMethodDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PaymentMethodDTOToJson(PaymentMethodDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'thumbnail': instance.thumbnail,
      'status': instance.status,
    };
