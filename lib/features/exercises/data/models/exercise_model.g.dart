// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      mediaUrl: json['mediaUrl'] as String,
      type: $enumDecode(_$ExerciseTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'mediaUrl': instance.mediaUrl,
      'type': _$ExerciseTypeEnumMap[instance.type]!,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.yoga: 'YOGA',
  ExerciseType.breathing: 'BREATHING',
  ExerciseType.vid_3d: 'VID_3D',
};
