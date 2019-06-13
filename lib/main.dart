import 'package:flutter/material.dart';
import 'package:my_flutter/bloc/theme.bloc.dart';
import 'package:my_flutter/config/themes.dart';
import 'package:my_flutter/config/routes.dart';
import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/environment.dart';

void main() async {
  await Environment.setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
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
    );
  }
}
