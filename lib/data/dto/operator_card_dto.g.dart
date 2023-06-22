// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorCardDTO _$OperatorCardDTOFromJson(Map<String, dynamic> json) =>
    OperatorCardDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      dataPlans: json['data_plans'] == null
          ? null
          : DataPlanDTO.fromJson(json['data_plans'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperatorCardDTOToJson(OperatorCardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'thumbnail': instance.thumbnail,
      'data_plans': instance.dataPlans,
    };
