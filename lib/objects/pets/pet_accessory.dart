import 'package:json_annotation/json_annotation.dart';

part 'pet_accessory.g.dart';

@JsonSerializable()
class PetAccessory {
  String? name;
  double? width;
  double? top;
  double? left;

  PetAccessory({this.name, this.width});

  factory PetAccessory.fromJson(Map<String, dynamic> json) =>
      _$PetAccessoryFromJson(json);

  Map<String, dynamic> toJson() => _$PetAccessoryToJson(this);
}
