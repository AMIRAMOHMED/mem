// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:mem/features/authentication/login/data/models/login_respons.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String content;
  final String groupId;
  final String senderId;
  final UserData sender;
  MessageModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.content,
    required this.groupId,
    required this.senderId,
    required this.sender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}