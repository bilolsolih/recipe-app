import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.161:8888/api/v1",
    validateStatus: (status) => true,
  ),
);
