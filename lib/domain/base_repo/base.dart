import '../../shared/constants/app_constants.dart';
import '../../di/di.dart';
import '../api_services/api_services.dart';

class Base {
  final ApiServices _apiServices =
      getIt.get<ApiServices>(instanceName: AppConstants.baseUrl);
  ApiServices get apiServices => _apiServices;

  final ApiServices _otherApiServices =
      getIt.get<ApiServices>(instanceName: AppConstants.otherBaseUrl);
  ApiServices get otherApiServices => _otherApiServices;

  // final ApiServices _apiServices = ApiServices(baseUrl: AppConstants.baseUrl);
  // ApiServices get apiServices => _apiServices;
  // final ApiServices _otherApiServices =
  //     ApiServices(baseUrl: AppConstants.otherBaseUrl);
  // ApiServices get otherApiServices => _otherApiServices;
}
