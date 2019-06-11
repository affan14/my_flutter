import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/redux/actions.dart';
import 'package:my_flutter/redux/appState.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    AppRoutes.navKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    AppRoutes.navKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}
