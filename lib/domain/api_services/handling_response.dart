import 'package:dio/dio.dart';
import '../../shared/console.dart';
import 'api_response.dart';

class HandlingResponse {
  static ApiResponse returnResponse(Response response) =>
      switch (response.statusCode) {
        200 => ApiResponse.completed(response),
        400 => ApiResponse.error('Some Error Occured'),
        401 => ApiResponse.unAuthorised('Un Authorized'),
        403 => ApiResponse.error('Un Authorized'),
        404 => ApiResponse.error('Un Authorized'),
        500 => ApiResponse.error('Some Error Occured'),
        -6 => ApiResponse.error('No Internet Connection'),
        _ => ApiResponse.error('Some Error Occured')
      };

  static ApiResponse returnException(DioException exception) {
    console(exception);
    console('EXCEPTION');
    return switch (exception.type) {
      DioExceptionType.connectionTimeout =>
        ApiResponse.error('Connection Timeout'),
      DioExceptionType.connectionError =>
        ApiResponse.noInternet('No Internet Connection'),
      DioExceptionType.badResponse => ApiResponse.error('Some Error Occured'),
      DioExceptionType.unknown => ApiResponse.error('Some Error Occured'),
      DioExceptionType.cancel => ApiResponse.error('Request cancelled'),
      _ => ApiResponse.error('Request cancelled'),
    };
  }
}
