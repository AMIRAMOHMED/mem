import 'package:json_annotation/json_annotation.dart';

part 'token_vaildate_response_body.g.dart';
@JsonSerializable()


class TokenVaildateResponseBody{

  final String ?errorCode;
  final String ?error;
  final bool  success;

  TokenVaildateResponseBody(this.success, {required this.errorCode, required this.error});

    factory TokenVaildateResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TokenVaildateResponseBodyFromJson(json);
}