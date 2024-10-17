import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:porto_vacation_club/shared/app_persistance/app_local.dart';
import '../../../shared/constants/app_constants.dart';
import '../../../shared/console.dart';
import '../../../shared/general_methods.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    console('ERROR_INTERCEPTORRRRRRRRRRRRR');
    // console('Status Code: ${err.response?.statusCode}');
    // console('error : ${err.error}');
    // console('message: ${err.message}');
    // console('req path: ${err.requestOptions.path}');
    // console('message: ${err.requestOptions.method}');
    // console(err.requestOptions.extra);
    // console("response.extra");
    if (err.requestOptions.extra[localDataStorageEnabled]) {
      var data = AppLocal.ins.dataBox.get(err.requestOptions.path);
      if (isNotNull(data)) {
        handler.resolve(Response(
            requestOptions: RequestOptions(),
            data: jsonDecode(data),
            statusCode: 200));
      } else {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
