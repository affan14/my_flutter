// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabayImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayImage _$PixabayImageFromJson(Map<String, dynamic> json) {
  return PixabayImage(
      largeImageURL: json['largeImageURL'] as String,
      webformatHeight: json['webformatHeight'] as int,
      webformatWidth: json['webformatWidth'] as int,
      likes: json['likes'] as int,
      imageWidth: json['imageWidth'] as int,
      id: json['id'] as int,
      userid: json['userid'] as int,
      views: json['views'] as int,
      comments: json['comments'] as int,
      pageURL: json['pageURL'] as String,
      imageHeight: json['imageHeight'] as int,
      webformatURL: json['webformatURL'] as String,
      type: json['type'] as String,
      previewHeight: json['previewHeight'] as int,
      tags: json['tags'] as String,
      downloads: json['downloads'] as int,
      user: json['user'] as String,
      favorites: json['favorites'] as int,
      imageSize: json['imageSize'] as int,
      previewWidth: json['previewWidth'] as int,
      userImageURL: json['userImageURL'] as String,
      previewURL: json['previewURL'] as String);
}

Map<String, dynamic> _$PixabayImageToJson(PixabayImage instance) =>
    <String, dynamic>{
      'largeImageURL': instance.largeImageURL,
      'webformatHeight': instance.webformatHeight,
      'webformatWidth': instance.webformatWidth,
      'likes': instance.likes,
      'imageWidth': instance.imageWidth,
      'id': instance.id,
      'userid': instance.userid,
      'views': instance.views,
      'comments': instance.comments,
      'pageURL': instance.pageURL,
      'imageHeight': instance.imageHeight,
      'webformatURL': instance.webformatURL,
      'type': instance.type,
      'previewHeight': instance.previewHeight,
      'tags': instance.tags,
      'downloads': instance.downloads,
      'user': instance.user,
      'favorites': instance.favorites,
      'imageSize': instance.imageSize,
      'previewWidth': instance.previewWidth,
      'userImageURL': instance.userImageURL,
      'previewURL': instance.previewURL
    };
