
import '../api_services/api_response.dart';
import '../base_repo/base.dart';

abstract class DummyRepo extends Base {
  Future<ApiResponse> getUser({bool enableLocalPersistence = false});
}
