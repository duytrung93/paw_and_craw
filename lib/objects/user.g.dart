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
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']),
      point: (json['point'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'userType': _$UserTypeEnumMap[instance.userType],
      'pet_id': instance.pet_id,
      'petName': instance.petName,
      'point': instance.point,
    };

const _$UserTypeEnumMap = {
  UserType.newAccount: 'newAccount',
  UserType.loginAccount: 'loginAccount',
  UserType.playWithoutAccount: 'playWithoutAccount',
};
