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
      accessories: json['accessories'],
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
      'accessories': instance.accessories,
      'id': instance.id,
      'creationTime': instance.creationTime,
      'concurrencyStamp': instance.concurrencyStamp,
    };
