import 'package:freezed_annotation/freezed_annotation.dart';

import '../api_services/api_response.dart';

part 'dummy.freezed.dart';

@freezed
class Dummy with _$Dummy {
  const factory Dummy({ApiResponse? airlineRes,ApiResponse? userRes}) = _dummy;
}
