// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAnimal _$DataAnimalFromJson(Map<String, dynamic> json) => DataAnimal(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      info: json['info'] as String? ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => LevelsBean.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => PetAccessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DataAnimalToJson(DataAnimal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'videos': instance.videos,
      'accessories': instance.accessories.map((e) => e.toJson()).toList(),
    };

LevelsBean _$LevelsBeanFromJson(Map<String, dynamic> json) => LevelsBean(
      level: json['level'] as num? ?? 0,
      level_name: json['level_name'] as String? ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => QuestionsBean.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LevelsBeanToJson(LevelsBean instance) =>
    <String, dynamic>{
      'level': instance.level,
      'level_name': instance.level_name,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

QuestionsBean _$QuestionsBeanFromJson(Map<String, dynamic> json) =>
    QuestionsBean(
      q: json['q'] as String? ?? '',
      as: (json['as'] as List<dynamic>?)
              ?.map((e) => AsBean.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionsBeanToJson(QuestionsBean instance) =>
    <String, dynamic>{
      'q': instance.q,
      'as': instance.as.map((e) => e.toJson()).toList(),
    };

AsBean _$AsBeanFromJson(Map<String, dynamic> json) => AsBean(
      a: json['a'] as String? ?? '',
      c: json['c'] as bool? ?? false,
    );

Map<String, dynamic> _$AsBeanToJson(AsBean instance) => <String, dynamic>{
      'a': instance.a,
      'c': instance.c,
    };
