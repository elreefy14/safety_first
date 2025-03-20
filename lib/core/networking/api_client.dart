import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/refresh_token_request.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_service.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  static final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory ApiClient() {
    return _instance;
  }

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);
    _dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    addDioInterceptor();
    ApiClient._internal();
    return _dio;
  }

  ApiClient._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _storage.read(key: 'access_token');
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Access Token expired
            final refreshToken = await _storage.read(key: 'refresh_token');
            if (refreshToken != null) {
              try {
                final newTokens = await _refreshToken(refreshToken);
                await _storage.write(
                  key: 'access_token',
                  value: newTokens.accessToken,
                );
                await _storage.write(
                  key: 'refresh_token',
                  value: newTokens.refreshToken,
                );

                // Retry the original request with the new access token
                error.requestOptions.headers['Authorization'] =
                    'Bearer ${newTokens.accessToken}';
                final response = await _dio.fetch(error.requestOptions);
                return handler.resolve(response);
              } catch (e) {
                // Refresh Token failed, log out the user
                await _storage.deleteAll();
                // Navigate to login screen
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<AuthResponseModel> _refreshToken(String refreshToken) async {
    final response = await apiService.refreshToken(
      RefreshTokenRequest(refreshToken: refreshToken),
    );
    return response;
  }

  AuthServices get apiService => AuthServices(_dio);

  static void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
