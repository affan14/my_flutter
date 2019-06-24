import 'package:json_annotation/json_annotation.dart';

part 'pixabayImage.g.dart';

// class PixabayHits {}

@JsonSerializable(nullable: false)
class PixabayImage {
  String largeImageURL;
  int webformatHeight;
  int webformatWidth;
  int likes;
  int imageWidth;
  int id;
  int userid;
  int views;
  int comments;
  String pageURL;
  int imageHeight;
  String webformatURL;
  String type;
  int previewHeight;
  String tags;
  int downloads;
  String user;
  int favorites;
  int imageSize;
  int previewWidth;
  String userImageURL;
  String previewURL;

  PixabayImage(
      {this.largeImageURL,
      this.webformatHeight,
      this.webformatWidth,
      this.likes,
      this.imageWidth,
      this.id,
      this.userid,
      this.views,
      this.comments,
      this.pageURL,
      this.imageHeight,
      this.webformatURL,
      this.type,
      this.previewHeight,
      this.tags,
      this.downloads,
      this.user,
      this.favorites,
      this.imageSize,
      this.previewWidth,
      this.userImageURL,
      this.previewURL});

  factory PixabayImage.fromJson(Map<String, dynamic> json) =>
      _$PixabayImageFromJson(json);
  Map<String, dynamic> toJson() => _$PixabayImageToJson(this);
}
