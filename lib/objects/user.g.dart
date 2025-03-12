// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      gender: json['gender'] as num?,
      pet_id: json['pet_id'] as num?,
      petName: json['petName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'petName': instance.petName,
      'gender': instance.gender,
      'pet_id': instance.pet_id,
    };
