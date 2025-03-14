import 'package:json_annotation/json_annotation.dart';

part 'youtube_metadata_fetch.g.dart';

@JsonSerializable()
class YoutubeMetadataFetch {
  String? title;
  String? author_name;
  String? author_url;
  String? type;
  num? height;
  num? width;
  String? version;
  String? provider_name;
  String? provider_url;
  num? thumbnail_height;
  num? thumbnail_width;
  String? thumbnail_url;
  String? html;

  YoutubeMetadataFetch(
      {this.title,
      this.author_name,
      this.author_url,
      this.type,
      this.height,
      this.width,
      this.version,
      this.provider_name,
      this.provider_url,
      this.thumbnail_height,
      this.thumbnail_width,
      this.thumbnail_url,
      this.html});

  factory YoutubeMetadataFetch.fromJson(Map<String, dynamic> json) =>
      _$YoutubeMetadataFetchFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeMetadataFetchToJson(this);
}
