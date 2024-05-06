// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetings_respons_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingResponsBody _$MeetingResponsBodyFromJson(Map<String, dynamic> json) =>
    MeetingResponsBody(
      json['dateTime'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      forWho: json['for'] as String?,
    );

Map<String, dynamic> _$MeetingResponsBodyToJson(MeetingResponsBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'for': instance.forWho,
      'dateTime': instance.dateTime,
    };
