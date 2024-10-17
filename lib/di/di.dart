import 'package:get_it/get_it.dart';
import '../domain/api_services/api_services.dart';
import '../shared/constants/app_constants.dart';

GetIt getIt = GetIt.instance;

class DI {
  static Future<void> initDI() async {
    getIt.registerLazySingleton<ApiServices>(
        () => ApiServices(baseUrl: AppConstants.baseUrl),
        instanceName: AppConstants.baseUrl);
    getIt.registerLazySingleton<ApiServices>(
        () => ApiServices(baseUrl: AppConstants.otherBaseUrl),
        instanceName: AppConstants.otherBaseUrl);
    // getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImp());
    await getIt.allReady();
  }
}
