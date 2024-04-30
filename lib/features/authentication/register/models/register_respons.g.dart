// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      type: json['type'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'type': instance.type,
      'profilePictureUrl': instance.profilePictureUrl,
      'token': instance.token,
    };
