import 'package:json_annotation/json_annotation.dart';
part 'register_requset_body.g.dart';
@JsonSerializable()
class RegisterRequestBody {


  String email;
  String firstName;
  String lastName;
  String password;
  String type;
  String username;
  String ?profilePictureUrl;
  RegisterRequestBody({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.type,
    required this.username,
     this.profilePictureUrl="",
  });
    Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}
