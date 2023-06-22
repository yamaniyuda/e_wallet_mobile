// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferHistoryDTO _$TransferHistoryDTOFromJson(Map<String, dynamic> json) =>
    TransferHistoryDTO(
      name: json['name'] as String?,
      id: json['id'] as int?,
      profilePicture: json['profile_picture'] as String?,
      username: json['username'] as String?,
      verified: json['verified'] as String?,
    );

Map<String, dynamic> _$TransferHistoryDTOToJson(TransferHistoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'verified': instance.verified,
      'profile_picture': instance.profilePicture,
    };
