// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_respons_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponsBody _$NotificationResponsBodyFromJson(
        Map<String, dynamic> json) =>
    NotificationResponsBody(
      json['dateTime'] as String?,
      json['message'] as String?,
      id: json['id'] as String?,
      forWho: json['for'] as String?,
    );

Map<String, dynamic> _$NotificationResponsBodyToJson(
        NotificationResponsBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'for': instance.forWho,
      'dateTime': instance.dateTime,
    };
