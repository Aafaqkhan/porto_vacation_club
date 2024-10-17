import 'dart:io';
import 'package:dio/dio.dart';
import '../../shared/constants/app_constants.dart';
import '../../shared/general_methods.dart';
import 'dio_core.dart';

class ApiServices extends DioCore {
  ApiServices({required String baseUrl}) : super(baseUrl);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      bool enableLocalPersistence = false}) async {
    return await dio.get(path,
        queryParameters: queryParameters,
        options: _options(enableLocalPersistence));
  }

  Future<Response> postJson(String path, dynamic data,
      {bool enableLocalPersistence = false}) async {
    return await dio.post(path,
        data: data, options: _options(enableLocalPersistence));
  }

  Future<Response> postFormData(String path,
      {Map<String, dynamic> data = const {},
      List<File> images = const [],
      String? imageFieldKey,
      bool enableLocalPersistence = false}) async {
    FormData formData = FormData.fromMap(data);
    for (var image in images) {
      formData.files.add(MapEntry(
          isNull(imageFieldKey) ? 'images' : imageFieldKey!,
          MultipartFile.fromFileSync(image.path)));
    }
    return await dio.post(path,
        data: formData, options: _options(enableLocalPersistence));
  }

  Future<Response> delete(String path,
      {bool enableLocalPersistence = false}) async {
    return await dio.delete(path, options: _options(enableLocalPersistence));
  }

  Future<Response> patch(String path, dynamic data,
      {bool enableLocalPersistence = false}) async {
    return await dio.patch(path,
        data: data, options: _options(enableLocalPersistence));
  }

  Future<Response> download(String url, String savePath) async {
    return await dio.download(url, savePath);
  }

  Options _options(bool enableLocalPersistence) =>
      Options(extra: {localDataStorageEnabled: enableLocalPersistence});
}
