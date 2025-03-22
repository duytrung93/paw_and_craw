import 'package:json_annotation/json_annotation.dart';

part 'api_result.g.dart';

@JsonSerializable()
class APIResult {
  dynamic value;
  dynamic targetUrl;
  bool isFailure;
  bool isSuccess;
  ErrorBean? error;
  bool unAuthorizedRequest;

  APIResult({
    this.value,
    this.targetUrl,
    this.isSuccess = true,
    this.isFailure = false,
    this.error,
    this.unAuthorizedRequest = false,
  });

  factory APIResult.fromJson(Map<String, dynamic> json) =>
      _$APIResultFromJson(json);

  Map<String, dynamic> toJson() => _$APIResultToJson(this);
}

@JsonSerializable()
class ErrorBean {
  String? code;
  String? description;
  num? type;

  ErrorBean({this.code, this.description, this.type});

  factory ErrorBean.fromJson(Map<String, dynamic> json) =>
      _$ErrorBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorBeanToJson(this);
}
