import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter/pages/carroussel/index.dart';
import 'package:my_flutter/repositories/carrousselRepository.dart';

class CarrousselBloc extends Bloc<CarrousselEvent, CarrousselState> {
  final CarrousselRepository carrousselRepository;
  static final CarrousselBloc _carrousselBlocSingleton =
      new CarrousselBloc._internal(
          carrousselRepository: CarrousselRepository());
  factory CarrousselBloc() {
    return _carrousselBlocSingleton;
  }
  CarrousselBloc._internal({@required this.carrousselRepository});

  CarrousselState get initialState => new CarrousselLoading();

  @override
  Stream<CarrousselState> mapEventToState(CarrousselEvent currentEvent) async* {
    yield* _mapLoadCarrousselToState();
  }

  Stream<CarrousselState> _mapLoadCarrousselToState() async* {
    try {
      final hits = await carrousselRepository.fetchAllImage();
      print(hits.totalHits);
      print(hits.hits[0].webformatURL);
      yield CarrousselLoaded(
        hits.hits,
      );
    } catch (_) {
      yield CarrousselNotLoaded();
    }
  }
}
