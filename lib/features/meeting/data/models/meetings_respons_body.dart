import 'package:json_annotation/json_annotation.dart';

part 'meetings_respons_body.g.dart';


@JsonSerializable()
class MeetingResponsBody {
  final String? id;
  final String ?name;
  final String ?url;
 @JsonKey(name: 'for')
  String? forWho; 
  final String?
   dateTime;


  MeetingResponsBody(
    this.dateTime, {
     this.id,
     this.name,
     this.url,
     this.forWho
  });
 

  factory MeetingResponsBody.fromJson(Map<String, dynamic> json) =>
      _$MeetingResponsBodyFromJson(json);
}
