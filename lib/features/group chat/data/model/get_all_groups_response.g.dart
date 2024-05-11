// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_groups_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllGroupResponseBody _$GetAllGroupResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetAllGroupResponseBody(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$GetAllGroupResponseBodyToJson(
        GetAllGroupResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
    };
