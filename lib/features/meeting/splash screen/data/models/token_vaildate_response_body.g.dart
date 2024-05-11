// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_vaildate_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenVaildateResponseBody _$TokenVaildateResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TokenVaildateResponseBody(
      json['success'] as bool,
      errorCode: json['errorCode'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$TokenVaildateResponseBodyToJson(
        TokenVaildateResponseBody instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'error': instance.error,
      'success': instance.success,
    };
