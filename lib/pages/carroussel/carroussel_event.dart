import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CarrousselEvent extends Equatable {
  CarrousselEvent([List props = const []]) : super(props);
}

class LoadCarrousselEvent extends CarrousselEvent {
  @override
  String toString() => 'LoadCarrousselEvent';
}
