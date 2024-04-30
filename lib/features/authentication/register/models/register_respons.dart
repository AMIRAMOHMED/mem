import 'package:json_annotation/json_annotation.dart';

part 'register_respons.g.dart';

@JsonSerializable()


@JsonSerializable()
class RegisterData {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? username;
  String? type;
  String? profilePictureUrl;
  String? token;

  RegisterData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.type,
    this.profilePictureUrl,
    this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}
