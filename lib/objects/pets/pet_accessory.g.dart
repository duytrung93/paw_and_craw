// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_accessory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetAccessory _$PetAccessoryFromJson(Map<String, dynamic> json) => PetAccessory(
      accessory_id: json['accessory_id'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      rotate: (json['rotate'] as num?)?.toDouble(),
      animal_id: json['animal_id'] as String?,
      animal_stage: (json['animal_stage'] as num?)?.toInt(),
      animal_stage_grow: (json['animal_stage_grow'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PetAccessoryToJson(PetAccessory instance) =>
    <String, dynamic>{
      'accessory_id': instance.accessory_id,
      'animal_id': instance.animal_id,
      'animal_stage': instance.animal_stage,
      'animal_stage_grow': instance.animal_stage_grow,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
      'rotate': instance.rotate,
    };
