import 'package:dio/dio.dart';

import '../core.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: AppEnvironment.config.baseUrl,
          connectTimeout: const Duration(seconds: 6),
          receiveTimeout: const Duration(seconds: 6),
          sendTimeout: const Duration(seconds: 6),
          responseType: ResponseType.json,
        ),
      ) {
    // ignore: avoid_print
    _dio.interceptors.add(LogInterceptor(request: true, requestBody: true, responseBody: true, responseHeader: false, requestHeader: true, error: true, logPrint: (object) => print('[DIO] $object')));
  }

  Future<T?> get<T>(String path) {
    return _dio.getData(path);
  }
}

extension DioExtensions on Dio {
  Future<T?> getData<T>(String path) async {
    try {
      final response = await get(path);

      return response.data;
    } catch (e) {
      throw mapToAppError(e);
    }
  }
}
