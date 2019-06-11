import 'package:my_flutter/redux/appState.dart';
import 'package:my_flutter/redux/middleware.dart';
import 'package:my_flutter/redux/reducers/appReducer.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();

  return Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createNavigationMiddleware(),
  );
}
