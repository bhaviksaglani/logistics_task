import 'package:logistics_test_app/business_logic/models/SearchResponseModel.dart';
import 'package:logistics_test_app/repositories/search_response_api.dart';

import 'api_provider.dart';

class SearchResponseApiImpl extends SearchResponseApi {
  ApiProvider apiProvider = ApiProvider();

  @override
  Future<SearchResponseModel> searchResponse(String query) async {
    var response = await apiProvider.httpGet(query);

    return SearchResponseModel.fromJson(response);
  }
}
