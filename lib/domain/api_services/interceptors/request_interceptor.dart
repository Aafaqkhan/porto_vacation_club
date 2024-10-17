import 'package:dio/dio.dart';
import '../../../shared/console.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    console('REQUEST_INTERCEPTORRRRRRRRRRRRR');
    // options.headers.addAll({"Content-Type": "application/json"});
    // options.headers['Authorization'] = AppData.instance.token;
    // console('--- Request ---');
    console('URL: ${options.uri}');
    // console('Method: ${options.method}');
    // console('Headers: ${options.headers}');
    // console('Body: ${options.data}');
    // console(options.extra);
    super.onRequest(options, handler);
  }
}
