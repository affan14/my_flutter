import 'package:my_flutter/models/pixabayHits.dart';
import 'package:my_flutter/providers/pixabayApiProvider.dart';

class CarrousselRepository {
  final _pixabayApiProvider = PixabayApiProvider();

  Future<PixabayHits> fetchAllImage() => _pixabayApiProvider.fetchImageList();
}
