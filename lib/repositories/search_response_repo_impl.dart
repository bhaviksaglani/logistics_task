import 'package:logistics_test_app/business_logic/models/SearchResponseModel.dart';
import 'package:logistics_test_app/repositories/search_response_api.dart';
import 'package:logistics_test_app/repositories/serach_response_repo.dart';

import '../services/service_locator.dart';

class SearchResponseRepoImpl extends SearchResponseRepo {
  SearchResponseApi searchResponseApi = serviceLocator<SearchResponseApi>();

  @override
  Future<SearchResponseModel> searchResponse(String query) {
    return searchResponseApi.searchResponse(query);
  }
}
