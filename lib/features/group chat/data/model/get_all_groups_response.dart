import 'package:json_annotation/json_annotation.dart';



part 'get_all_groups_response.g.dart';
@JsonSerializable()
class GetAllGroupResponseBody {
  final String? id;
  final String ?name;
  final String ?createdAt;
 

  GetAllGroupResponseBody(
  {
     this.id,
     this.name,
     this.createdAt,
 
  });
 

  factory GetAllGroupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetAllGroupResponseBodyFromJson(json);
}