import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://10.10.0.138:8888/api/v1",
    validateStatus: (status) => true,
  ),
);
