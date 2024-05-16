
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiService {
  final Dio dio;
  static const baseUrl = 'http://192.168.1.5:8080/products/';


  ApiService(this.dio);
  Future<List<dynamic>> get({required String query}) async {
    dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    var response = await dio.get('$baseUrl$query',
        options: buildCacheOptions(const Duration(days: 7),
            forceRefresh: false,
            options: Options(
              receiveTimeout: 1000000,
              sendTimeout: 1000000,
            )));

    return response.data;
  }
}
