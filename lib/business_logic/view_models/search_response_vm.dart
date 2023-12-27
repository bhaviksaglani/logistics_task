import 'package:flutter/cupertino.dart';
import 'package:logistics_test_app/business_logic/models/SearchResponseModel.dart';
import 'package:logistics_test_app/repositories/serach_response_repo.dart';

import '../../services/service_locator.dart';
import 'package:flutter/material.dart';

class SearchResponseViewModel extends ChangeNotifier {
  SearchResponseRepo searchResponseRepo = serviceLocator<SearchResponseRepo>();
  SearchResponseModel? searchResponseModel;
  List<Value?>? values = [];

  bool isLoading = false;

  Future<void> search(String query) async {
    isLoading = true;

    try {
      var response = await searchResponseRepo.searchResponse(query);
      searchResponseModel = response;
      if (searchResponseModel?.value != null &&
          searchResponseModel!.value!.isNotEmpty) {
        values = searchResponseModel!.value;
      } else {
        values = [];
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('SearchResponseViewModel API error...$e');

      isLoading = false;
      notifyListeners();
    }
  }
}
