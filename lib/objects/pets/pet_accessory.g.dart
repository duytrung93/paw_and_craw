// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_accessory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetAccessory _$PetAccessoryFromJson(Map<String, dynamic> json) => PetAccessory(
      name: json['name'] as String?,
      width: (json['width'] as num?)?.toDouble(),
    )
      ..top = (json['top'] as num?)?.toDouble()
      ..left = (json['left'] as num?)?.toDouble();

Map<String, dynamic> _$PetAccessoryToJson(PetAccessory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'width': instance.width,
      'top': instance.top,
      'left': instance.left,
    };
