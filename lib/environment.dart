import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/config/ioc.dart';
import 'package:my_flutter/redux/store.dart';
import 'package:my_flutter/services/database.service.dart';

class Environment {
  static setup() async {
    // lock orientation position
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // transparent status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    Ioc.setupIocDependency();
    await ioc.get<SqliteDbService>().initDatabase();

    return await createStore();
  }
}
