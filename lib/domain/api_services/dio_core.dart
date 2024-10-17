import 'package:dio/dio.dart';
import '../../shared/constants/app_constants.dart';
import 'interceptors/connectivity_interceptor.dart';
import 'interceptors/mock_interceptor.dart';
import 'interceptors/prod_response_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class DioCore {
  late Dio _dio;
  Dio get dio => _dio;
  DioCore(String baseUrl) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    // _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(ConnectivityInterceptor());
    _dio.interceptors.add(RequestInterceptor());
    _dio.interceptors.add(ErrorInterceptor());

    // _dio.interceptors.add(RetryInterceptor());
    if (AppConstants.responseMode == ResponseMode.mock) {
      _dio.interceptors.add(MockInterceptor());
    } else if (AppConstants.responseMode == ResponseMode.real) {
      _dio.interceptors.add(ProdResponseInterceptor());
    }
  }
}
