

import 'package:json_annotation/json_annotation.dart';

part 'token_request_body.g.dart';
@JsonSerializable()
class TokenRequestBody {
  final String token;

  TokenRequestBody({
    required this.token,
  });
    Map<String, dynamic> toJson() => _$TokenRequestBodyToJson(this); 

}