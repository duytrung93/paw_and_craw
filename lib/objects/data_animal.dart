import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/objects/pets/pet_accessory.dart';

part 'data_animal.g.dart';

@JsonSerializable(explicitToJson: true)
class DataAnimal {
  String id;
  String name;
  String info;
  late List<LevelsBean> questions;
  late List<String> videos;
  late List<PetAccessory> accessories;

  DataAnimal({
    this.id = '',
    this.name = '',
    this.info = '',
    List<LevelsBean>? questions,
    List<String>? videos,
    List<PetAccessory>? accessories,
  }) {
    this.questions = questions ?? [];
    this.videos = videos ?? [];
    this.accessories = accessories ?? [];
  }

  factory DataAnimal.fromJson(Map<String, dynamic> json) =>
      _$DataAnimalFromJson(json);

  Map<String, dynamic> toJson() => _$DataAnimalToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LevelsBean {
  num level;
  String level_name;
  late List<QuestionsBean> questions;

  LevelsBean({
    this.level = 0,
    this.level_name = '',
    List<QuestionsBean>? questions,
  }) {
    this.questions = questions ?? [];
  }

  factory LevelsBean.fromJson(Map<String, dynamic> json) =>
      _$LevelsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LevelsBeanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionsBean {
  String q;
  late List<AsBean> as;

  QuestionsBean({this.q = '', List<AsBean>? as}) {
    this.as = as ?? [];
  }

  factory QuestionsBean.fromJson(Map<String, dynamic> json) =>
      _$QuestionsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsBeanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AsBean {
  String a;
  bool c;

  AsBean({this.a = '', this.c = false});

  factory AsBean.fromJson(Map<String, dynamic> json) => _$AsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AsBeanToJson(this);
}
