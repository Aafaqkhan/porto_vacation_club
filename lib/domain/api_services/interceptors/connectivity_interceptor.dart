import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../shared/console.dart';

class ConnectivityInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    console('CONNECTIVITY_INTERCEPTORRRRRRRRRRRRR');
    if (connectivityResult.contains(ConnectivityResult.none) && !options.extra[localDataStorageEnabled]) {
      handler.reject(DioException(
        requestOptions: options,
        error: 'No Internet Connection',
        type: DioExceptionType.connectionError,
      ));
      // throw Exception(
      // requestOptions: options,
      // response: Response(requestOptions: RequestOptions(),statusCode: 501),
      // error: 'No Internet Connection',
      // type: DioExceptionType.connectionError,
      // );
    } else {
      handler.next(options);
    }
  }
}
