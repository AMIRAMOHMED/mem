import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel {
  String? id;

  String? email;

  String? firstName;
  String? lastName;
  String? username;
  String? type;
  String? profilePictureUrl;
  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.type,
    this.profilePictureUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
