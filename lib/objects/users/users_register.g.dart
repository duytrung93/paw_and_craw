// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersRegister _$UsersRegisterFromJson(Map<String, dynamic> json) =>
    UsersRegister(
      username: json['username'] as String?,
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
      rePassword: json['rePassword'] as String?,
    );

Map<String, dynamic> _$UsersRegisterToJson(UsersRegister instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
      'rePassword': instance.rePassword,
    };
