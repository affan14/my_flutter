import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_flutter/bloc/theme.bloc.dart';
import 'package:my_flutter/config/themes.dart';
import 'package:my_flutter/config/routes.dart';
import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/environment.dart';
import 'package:my_flutter/redux/appState.dart';
import 'package:redux/redux.dart';

void main() async {
  final Store<AppState> store = await Environment.setup();
  runApp(App(store));
}

class App extends StatelessWidget {
  final Store<AppState> store;

  App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StreamBuilder<Object>(
        stream: themeBloc.themeEnabled,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'My Flutter',
            theme: getThemeByType(snapshot.data),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: generateRoutes,
            //routes: routes,
            navigatorKey: AppRoutes.navKey,
          );
        },
      ),
    );
  }
}
