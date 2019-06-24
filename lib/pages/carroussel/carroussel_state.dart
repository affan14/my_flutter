import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter/models/pixabayImage.dart';

@immutable
abstract class CarrousselState extends Equatable {
  CarrousselState([List props]) : super(props);
}

class CarrousselLoading extends CarrousselState {
  @override
  String toString() => 'CarrousselLoading';
}

class CarrousselLoaded extends CarrousselState {
  final List<PixabayImage> pixabayImages;

  CarrousselLoaded([this.pixabayImages = const []]);

  @override
  String toString() => 'CarrousselLoaded';
}

class CarrousselNotLoaded extends CarrousselState {
  @override
  String toString() => 'CarrousselNotLoaded';
}
