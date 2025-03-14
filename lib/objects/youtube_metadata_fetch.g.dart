// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_metadata_fetch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeMetadataFetch _$YoutubeMetadataFetchFromJson(
        Map<String, dynamic> json) =>
    YoutubeMetadataFetch(
      title: json['title'] as String?,
      author_name: json['author_name'] as String?,
      author_url: json['author_url'] as String?,
      type: json['type'] as String?,
      height: json['height'] as num?,
      width: json['width'] as num?,
      version: json['version'] as String?,
      provider_name: json['provider_name'] as String?,
      provider_url: json['provider_url'] as String?,
      thumbnail_height: json['thumbnail_height'] as num?,
      thumbnail_width: json['thumbnail_width'] as num?,
      thumbnail_url: json['thumbnail_url'] as String?,
      html: json['html'] as String?,
    );

Map<String, dynamic> _$YoutubeMetadataFetchToJson(
        YoutubeMetadataFetch instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author_name': instance.author_name,
      'author_url': instance.author_url,
      'type': instance.type,
      'height': instance.height,
      'width': instance.width,
      'version': instance.version,
      'provider_name': instance.provider_name,
      'provider_url': instance.provider_url,
      'thumbnail_height': instance.thumbnail_height,
      'thumbnail_width': instance.thumbnail_width,
      'thumbnail_url': instance.thumbnail_url,
      'html': instance.html,
    };
