import 'package:get_it/get_it.dart';
import 'package:my_flutter/services/database.service.dart';
import 'package:my_flutter/services/web.client.dart';

final GetIt ioc = GetIt();

class Ioc {
  static setupIocDependency() {
    ioc.registerSingleton<SqliteDbService>(new SqliteDbService());
    ioc.registerSingleton<WebClient>(new WebClient());
  }

  static T get<T>() {
    return ioc<T>();
  }
}
