import 'package:dio/dio.dart';

abstract class DioService {
  static final _baseOptions =
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/');
  static final Dio dio = Dio(_baseOptions);
}
