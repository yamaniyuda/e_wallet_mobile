// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPlanDTO _$DataPlanDTOFromJson(Map<String, dynamic> json) => DataPlanDTO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      operatorCardId: json['operator_card_id'] as int?,
    );

Map<String, dynamic> _$DataPlanDTOToJson(DataPlanDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'operator_card_id': instance.operatorCardId,
    };
