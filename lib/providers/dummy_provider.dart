import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porto_vacation_club/domain/data_classes/dummy.dart';
import '../domain/api_services/api_response.dart';
import '../domain/base_repo/base_repo.dart';
import '../shared/console.dart';

final dummyProvider = NotifierProvider<DummyProvider, Dummy>(DummyProvider.new);

class DummyProvider extends Notifier<Dummy> with BaseRepo {
  @override
  Dummy build() =>
      Dummy(airlineRes: ApiResponse.loading(), userRes: ApiResponse.loading());

  getUsers() async {
    ApiResponse userRes = await dummyRepo.getUser(enableLocalPersistence: true);
    state = state.copyWith(userRes: userRes);
    console('PROVIDERR : ${userRes.status}');
  }

  getAir() async {
    ApiResponse airlineRes =
        await dummyRepo.getUser(enableLocalPersistence: true);
    state = state.copyWith(airlineRes: airlineRes);
    console('PROVIDERR : ${airlineRes.status}');
  }
}
