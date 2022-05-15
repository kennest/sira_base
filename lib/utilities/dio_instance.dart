import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sira_base/utilities/dio_interceptor.dart';

final DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

class DioInstance {
  init() {
    final dio = Dio();
    dio.interceptors.add(_dioCacheManager.interceptor);
    dio.interceptors.add(CustomInterceptors());
    return dio;
  }
}
