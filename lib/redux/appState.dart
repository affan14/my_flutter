import 'package:flutter/material.dart';
import 'package:my_flutter/constants/navigations.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<String> route;

  AppState({this.isLoading = false, this.route = const [AppRoutes.SPLASH]});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({bool isLoading}) =>
      AppState(isLoading: isLoading ?? this.isLoading, route: this.route);

  @override
  int get hashCode => isLoading.hashCode ^ route.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          route == other.route;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, route: $route}';
  }
}
