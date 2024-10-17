import '../api_repos_abstract/dummy_repo.dart';
import '../api_repos_impl/dummy_repo_impl.dart';

mixin BaseRepo {
  final DummyRepo _dummyRepo = DummyRepoImpl();
  DummyRepo get dummyRepo => _dummyRepo;
}
