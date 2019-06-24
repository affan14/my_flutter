// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabayHits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayHits _$PixabayHitsFromJson(Map<String, dynamic> json) {
  return PixabayHits(
      totalHits: json['totalHits'] as int,
      hits: (json['hits'] as List)
          .map((e) => PixabayImage.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$PixabayHitsToJson(PixabayHits instance) =>
    <String, dynamic>{'totalHits': instance.totalHits, 'hits': instance.hits};
