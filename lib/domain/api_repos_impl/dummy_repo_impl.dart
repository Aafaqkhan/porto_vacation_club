import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:porto_vacation_club/domain/api_models/dummy_model.dart';
import '../../shared/constants/app_api_paths.dart';
import '../../shared/console.dart';
import '../api_repos_abstract/dummy_repo.dart';
import '../api_services/api_response.dart';
import '../api_services/handling_response.dart';

// for list do like this
// List<PhotosModel> data = List<PhotosModel>.from(
//     res.data.map((x) => PhotosModel.fromJson(x)));
// List<PhotosModel> data = await Isolate.run(() => List<PhotosModel>.from(
//     res.data.map((x) => PhotosModel.fromJson(x))));
class DummyRepoImpl extends DummyRepo {
  @override
  Future<ApiResponse> getUser({bool enableLocalPersistence = true}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.passengers,
          enableLocalPersistence: enableLocalPersistence);
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        DummyModel data =
            await Isolate.run(() => DummyModel.fromJson(res.data));
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } on DioException catch (w) {
      return HandlingResponse.returnException(w);
    }
  }
}
