import 'package:dio/dio.dart';
import 'package:m4_user/core/constants/app_constants.dart';
import 'package:m4_user/core/services/logger_service.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = AppConstants.apiBaseUrl;
    _dio.options.connectTimeout =
        const Duration(seconds: AppConstants.connectionTimeout);
    _dio.options.receiveTimeout =
        const Duration(seconds: AppConstants.receiveTimeout);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        AppLogger.debug('API Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger.debug(
            'API Response: ${response.statusCode} from ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        AppLogger.error('API Error: ${e.message} from ${e.requestOptions.uri}');
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
