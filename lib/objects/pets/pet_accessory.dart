import 'package:json_annotation/json_annotation.dart';
import 'package:paw_and_craw/api/api.dart';

part 'pet_accessory.g.dart';

@JsonSerializable()
class PetAccessory {
  String? accessory_id;
  String? animal_id;
  int? animal_stage;
  int? animal_stage_grow;
  double? width;
  double? x;
  double? y;
  double? rotate;

  PetAccessory({
    this.accessory_id,
    this.width,
    this.x,
    this.y,
    this.rotate,
    this.animal_id,
    this.animal_stage,
    this.animal_stage_grow,
  });

  factory PetAccessory.fromJson(Map<String, dynamic> json) =>
      _$PetAccessoryFromJson(json);

  Map<String, dynamic> toJson() => _$PetAccessoryToJson(this);

  String get id => '$animal_id-$animal_stage-$animal_stage_grow';

  // String get url =>
  //     'assets/images/pet_${animal_id}_${animal_stage}_$animal_stage_grow.png';
  String get url {
    var paths = [];
    switch (animal_stage) {
      case 1:
        paths.add('newborn');
        break;
      case 2:
        paths.add('teenager');
        break;
      case 3:
        paths.add('adult');
        break;
      default:
        paths.add('adult');
        break;
    }
    switch (animal_stage_grow) {
      case 0:
        break;
      case 1:
        paths.add('1');
        break;
      case 2:
        paths.add('2');
        break;
      case 3:
        paths.add('3');
        break;
      default:
        paths.add('3');
        break;
    }

    return api('Images/$animal_id/${paths.join('_')}.png').toString();
    return 'assets/images/pet_${animal_id}_${animal_stage}_$animal_stage_grow.png';
  }

  String get accessoryUrl => 'assets/v2_images/$accessory_id';
}
