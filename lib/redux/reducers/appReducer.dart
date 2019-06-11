import 'package:my_flutter/redux/appState.dart';
import 'package:my_flutter/redux/reducers/loadingReducer.dart';
import 'package:my_flutter/redux/reducers/navigationReducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      route: navigationReducer(state.route, action));
}
