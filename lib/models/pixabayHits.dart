import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter/models/pixabayImage.dart';

part 'pixabayHits.g.dart';

@JsonSerializable(nullable: false)
class PixabayHits {
  int totalHits;
  List<PixabayImage> hits;
  PixabayHits({this.totalHits, this.hits});
  factory PixabayHits.fromJson(Map<String, dynamic> json) =>
      _$PixabayHitsFromJson(json);
  Map<String, dynamic> toJson() => _$PixabayHitsToJson(this);
}
