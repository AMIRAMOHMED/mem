
import 'package:json_annotation/json_annotation.dart';

part 'set_firebase_id_request_body.g.dart';
@JsonSerializable()

class SetFireBaseIdBodyRequest{
  final String id;

  SetFireBaseIdBodyRequest({required this.id});

    Map<String, dynamic> toJson() => _$SetFireBaseIdBodyRequestToJson(this); 

}