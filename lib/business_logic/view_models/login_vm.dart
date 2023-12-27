import 'package:flutter/cupertino.dart';
import 'package:logistics_test_app/utils/constants.dart';

class LoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  bool showSpinner = false;
  String errorMessage = '';

  void setEmail(String value) {
    email = value;
    validateEmail(value);
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setShowSpinner(bool value) {
    showSpinner = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }
}
