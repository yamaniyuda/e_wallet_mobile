import 'package:dio/dio.dart';
import 'package:e_wallet_mobile/config/constants.dart';

part 'dio_interceptor.dart';
part 'dio_cache_interceptor.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient {
  late Dio _dio;
  late String _baseUrl;

  Dio get dio => _dio;
  String get baseUrl => _baseUrl;

  Dio init([String baseUrl = Constants.baseUrlApi]) {
    _baseUrl = baseUrl;
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: _baseUrl,
        responseType: ResponseType.json,
        followRedirects: true,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
      )
    );
    return dio;
  }

  DioClient addInterceptor() {
    _dio.interceptors.add(DioInterceptor());
    return this;
  }

  DioClient addCacheInterceptor() {
    _dio.interceptors.add(DioCacheInterceptor());
    return this;
  }

  Future<T> getRequest<T>(String endpoint, {
    required ResponseConverter<T> converter,
    Map<String, dynamic>? queryParameters
  }) async {
    final Response response = await _dio.get(endpoint, queryParameters: queryParameters);
    return converter(response.data);
  }

  Future<T> postRequest<T>(String endpoint, {
    required ResponseConverter<T> converter,
    required Map<String, dynamic> data
  }) async {
    final Response response = await _dio.post(endpoint, data: data);
    return converter(response.data);
  }

  Future<T> patchRequest<T>(String endpoint, {
    required ResponseConverter<T> converter,
    required Map<String, dynamic> data
  }) async {
    final Response response = await _dio.patch(endpoint, data: data);
    return converter(response.data);
  }

  Future<T> deleteRequest<T>(String endpoint, {
    required String uuid,
    required ResponseConverter<T> converter,
    required Map<String, dynamic> data
  }) async {
    final Response response = await _dio.delete("$endpoint/$uuid", data: data);
    return converter(response.data);
  }
}