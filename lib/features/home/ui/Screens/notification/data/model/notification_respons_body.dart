import 'package:json_annotation/json_annotation.dart';

part 'notification_respons_body.g.dart';

@JsonSerializable()
class NotificationResponsBody {
  final String? id;
  final String ?message;
 @JsonKey(name: 'for')
  String? forWho; 
  final String?
   dateTime;


  NotificationResponsBody(
    this.dateTime, this.message, {
     this.id,
     this.forWho
  });
 

  factory NotificationResponsBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponsBodyFromJson(json);
}
