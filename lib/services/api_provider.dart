import 'dart:convert';

import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class ApiProvider {
  Future<dynamic> httpGet(var data) async {
    final String apiUrl =
        'https://lorriservice.azurefd.net/api/autocomplete?suggest=$data&amp;limit=20&amp;searchFields=new_locations';
    var responseJson;
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print("api provider,,${response}");
      responseJson = _response(response);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['error'] != null) {
          throw response.body.toString();
        } else {
          throw BadRequestException(response.body.toString());
        }

      case 401:
        var responseJson = json.decode(response.body.toString());
        if (responseJson["status"] != "error") {
          return responseJson;
        } else {
          throw UnauthorisedException(response.body.toString());
        }
      case 403:
        print(response.body.toString());
        throw UnauthorisedException(response.body.toString());
      case 500:
        print(response.body.toString());
        throw InternalServerError(response.body.toString());
      default:
        FetchDataException(
            'Error occurred while Communication with Server with StatusCode ${response.statusCode}');
    }
  }
}
