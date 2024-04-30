// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      type: json['type'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'type': instance.type,
      'profilePictureUrl': instance.profilePictureUrl,
    };
