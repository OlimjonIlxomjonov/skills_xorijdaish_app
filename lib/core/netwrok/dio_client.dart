import 'package:dio/dio.dart';
import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/services/token_storage/token_storage_service_impl.dart';

class DioClient {
  final Dio _dio;

  DioClient._internal()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiUrls.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
        ),
      ) {
    // Logging
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorageServiceImpl().getAccessToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  // Optional manual override
  void setToken(String token) {
    _dio.options.headers['Authorization'] = "Bearer $token";
  }

  /// GET
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  /// POST
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await _dio.delete(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}
