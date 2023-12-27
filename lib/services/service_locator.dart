import 'package:get_it/get_it.dart';
import 'package:logistics_test_app/business_logic/view_models/search_response_vm.dart';
import 'package:logistics_test_app/repositories/search_response_api.dart';
import 'package:logistics_test_app/repositories/search_response_repo_impl.dart';
import 'package:logistics_test_app/repositories/serach_response_repo.dart';
import 'package:logistics_test_app/services/search_response_api_impl.dart';

final serviceLocator = GetIt.instance;
void setupServices() {
  // general

  serviceLocator
    ..registerLazySingleton<SearchResponseApi>(() => SearchResponseApiImpl())
    ..registerLazySingleton<SearchResponseRepo>(() => SearchResponseRepoImpl())
    ..registerFactory<SearchResponseViewModel>(() => SearchResponseViewModel());
}
