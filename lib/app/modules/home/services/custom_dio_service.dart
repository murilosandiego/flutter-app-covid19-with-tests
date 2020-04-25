import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../shared/constants/api_constants.dart';

class CustomDioService {
  Dio _client;

  CustomDioService() {
    _client = Dio(_options);
    _client.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: BASE_URL)).interceptor);
  }

  Dio get http => _client;

  BaseOptions _options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 50000,
    receiveTimeout: 50000,
  );

  CustomDioService.withAuthentication() {
    _client = Dio(_options);
    _client.interceptors.add(InterceptorsWrapper());
  }
}
