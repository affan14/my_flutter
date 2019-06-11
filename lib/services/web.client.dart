import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter/constants/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = new Dio()
  ..options.baseUrl = Env.API_URL
  ..options.connectTimeout = 5000
  ..options.receiveTimeout
  ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};

class WebClient {
  const WebClient();

  void addBasicAuthInterceptor(String username, String password) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var token = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      options.headers.putIfAbsent('Authorization', () => token);
      return options;
    }));
  }

  void addApiKeyInterceptor() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString(Env.TOKEN_KEY);

      if (token != null) {
        options.headers.putIfAbsent('Authorization', () => token);
      }

      return options;
    }));
  }

  void clearInterceptors() {
    dio.interceptors.clear();
  }

  dynamic commonBehavior(Response response) {
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.data);
    }

    return response.data;
  }

  Future<dynamic> get(String uri) async {
    final Response response = await dio.get(uri);
    return commonBehavior(response);
  }

  Future<dynamic> post(String uri, dynamic data) async {
    try {
      final Response response = await dio.post(uri, data: data);
      return commonBehavior(response);
    } catch (e) {
      throw ('An error occurred');
    }
  }

  Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return commonBehavior(response);
    } catch (e) {
      throw ('An error occurred');
    }
  }
}

final WebClient http = new WebClient();
