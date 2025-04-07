// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      music: json['music'] as bool?,
      vibrate: json['vibrate'] as bool?,
      notification: json['notification'] as bool?,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'music': instance.music,
      'vibrate': instance.vibrate,
      'notification': instance.notification,
    };
