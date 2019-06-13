import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter/config/ioc.dart';
import 'package:my_flutter/constants/colors.dart';
import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/services/database.service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' as io;

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<PermissionGroup> permissions = new List<PermissionGroup>();

  void _navigateHome() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
  }

  _startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, _navigateHome);
  }

  checkPermissions() async {
    PermissionStatus permissionStatus =
        await PermissionHandler.checkPermissionStatus(PermissionGroup.storage);
    if (permissionStatus != PermissionStatus.granted)
      permissions.add(PermissionGroup.storage);
    await requestPermission();
  }

  requestPermission() async {
    await PermissionHandler.requestPermissions(permissions)
        .then((result) async {
      if (result[PermissionGroup.storage] == PermissionStatus.granted) {
        print('permission granted');
        await ioc.get<SqliteDbService>().initDatabase();
        var path = ioc.get<SqliteDbService>().dbPathName;
        var exist = await io.File(path).exists();
        print('$path exist $exist');
      }
    });
  }

  @override
  void initState() {
    checkPermissions();
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var flutterIcon =
        'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png';

    return Scaffold(
        body: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [BlueRaspberry.start, BlueRaspberry.end],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: Center(
                  child: Image.network(
                flutterIcon,
                width: width * .25,
                fit: BoxFit.contain,
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation(Colors.black12),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
