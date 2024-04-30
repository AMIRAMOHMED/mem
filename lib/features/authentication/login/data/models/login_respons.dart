import 'package:json_annotation/json_annotation.dart';

part 'login_respons.g.dart';

@JsonSerializable()
class UserData {
  String? token;
  String? id;

  String? email;

  String? firstName;
  String? lastName;
  String? username;
  String? type;
  String? profilePictureUrl;
  UserData({
    this.token,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.type,
    this.profilePictureUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
