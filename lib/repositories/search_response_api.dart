import 'package:logistics_test_app/business_logic/models/SearchResponseModel.dart';

abstract class SearchResponseApi {
  Future<SearchResponseModel> searchResponse(String query);
}
