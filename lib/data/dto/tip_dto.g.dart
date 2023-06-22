// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipDTO _$TipDTOFromJson(Map<String, dynamic> json) => TipDTO(
      id: json['id'] as int?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TipDTOToJson(TipDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
    };
