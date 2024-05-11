import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

enum ExerciseType {
  @JsonValue('YOGA')
  yoga,
  @JsonValue('BREATHING')
  breathing,
  @JsonValue("VID_3D")
  vid_3d
}

@JsonSerializable()
class ExerciseModel {
  final String id, name, description, mediaUrl;
  final ExerciseType type;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.mediaUrl,
    required this.type,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
}
