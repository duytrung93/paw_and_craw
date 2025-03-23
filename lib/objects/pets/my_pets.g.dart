// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_pets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPets _$MyPetsFromJson(Map<String, dynamic> json) => MyPets(
      animalId: json['animalId'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt(),
      stage: json['stage'] as String?,
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => MyPetsAccessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accessoriesBind: (json['accessoriesBind'] as List<dynamic>?)
              ?.map((e) => MyPetsAccessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String?,
      creationTime: json['creationTime'] as String?,
      concurrencyStamp: json['concurrencyStamp'] as String?,
    );

Map<String, dynamic> _$MyPetsToJson(MyPets instance) => <String, dynamic>{
      'animalId': instance.animalId,
      'userId': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'stage': instance.stage,
      'accessories': instance.accessories?.map((e) => e.toJson()).toList(),
      'accessoriesBind':
          instance.accessoriesBind?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'creationTime': instance.creationTime,
      'concurrencyStamp': instance.concurrencyStamp,
    };

MyPetsAccessory _$MyPetsAccessoryFromJson(Map<String, dynamic> json) =>
    MyPetsAccessory(
      accessory_id: json['accessory_id'] as String?,
    );

Map<String, dynamic> _$MyPetsAccessoryToJson(MyPetsAccessory instance) =>
    <String, dynamic>{
      'accessory_id': instance.accessory_id,
    };
