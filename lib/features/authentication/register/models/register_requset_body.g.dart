// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'register_requset_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      password: json['password'] as String,
      type: json['type'] as String,
      username: json['username'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String? ?? "",
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
        RegisterRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'type': instance.type,
      'username': instance.username,
      'profilePictureUrl': instance.profilePictureUrl,
    };
