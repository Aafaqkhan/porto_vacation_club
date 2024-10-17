import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:porto_vacation_club/shared/app_persistance/app_local.dart';
import '../../../shared/console.dart';
import '../../../shared/constants/app_constants.dart';

class ProdResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    console('PRODUCTION_INTERCEPTORRRRRRRRRRRRR');
    // console('Status Code: ${response.statusCode}');
    // console('Data: ${response.data.runtimeType}');
    // console(response.requestOptions.extra);
    // console("response.extra");
    // console('end Production interceptorrrrrrrrrrrrrrrr--- Response ---');
    if (response.requestOptions.extra[localDataStorageEnabled]) {
      AppLocal.ins.dataBox
          .put(response.requestOptions.path, jsonEncode(response.data));
    }
    super.onResponse(response, handler);
  }
}
