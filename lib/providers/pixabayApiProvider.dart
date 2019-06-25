import 'package:dio/dio.dart';
import 'package:my_flutter/constants/env.dart';
import 'package:my_flutter/models/pixabayHits.dart';

class PixabayApiProvider {
  Dio client;

  PixabayApiProvider() {
    client = Dio()
      ..options.baseUrl = 'https://pixabay.com'
      ..options.connectTimeout = 5000
      ..options.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};
  }

  Future<PixabayHits> fetchImageList() async {
    final response = await client.get('/api/', queryParameters: {
      'key': Env.PIXABAY_API_KEY,
      'lang': 'id',
      'image_type': 'all',
      // 'orientation': 'horizontal',
      // 'catagory': 'computer',
      'per_page': 5,
      'q':'desain+datar'
    });
    print(response.data.toString());
    if (response.statusCode == 200)
      return PixabayHits.fromJson(response.data);
    else
      throw Exception('Failed to load data');
  }
}
