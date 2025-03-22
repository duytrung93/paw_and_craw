// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResult _$APIResultFromJson(Map<String, dynamic> json) => APIResult(
      value: json['value'],
      targetUrl: json['targetUrl'],
      isSuccess: json['isSuccess'] as bool? ?? true,
      isFailure: json['isFailure'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : ErrorBean.fromJson(json['error'] as Map<String, dynamic>),
      unAuthorizedRequest: json['unAuthorizedRequest'] as bool? ?? false,
    );

Map<String, dynamic> _$APIResultToJson(APIResult instance) => <String, dynamic>{
      'value': instance.value,
      'targetUrl': instance.targetUrl,
      'isFailure': instance.isFailure,
      'isSuccess': instance.isSuccess,
      'error': instance.error,
      'unAuthorizedRequest': instance.unAuthorizedRequest,
    };

ErrorBean _$ErrorBeanFromJson(Map<String, dynamic> json) => ErrorBean(
      code: json['code'] as String?,
      description: json['description'] as String?,
      type: json['type'] as num?,
    );

Map<String, dynamic> _$ErrorBeanToJson(ErrorBean instance) => <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'type': instance.type,
    };
