import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logistics_test_app/utils/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../utils/rounded_button.dart';
import 'package:logistics_test_app/route/auto_route.gr.dart';

// const kTextFieldDecoration = InputDecoration(
//   hintText: 'Enter a value',
//   hintStyle: TextStyle(color: Colors.grey),
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
// );

class RegistrationScreenState extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;
  String errorMessage = '';

  RegistrationScreenState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void setShowSpinner(bool value) {
    showSpinner = value;
    notifyListeners();
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  bool validateInputs() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setErrorMessage('Email and password cannot be empty');
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationScreenState(),
      child: _RegistrationScreen(),
    );
  }
}

class _RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<_RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Consumer<RegistrationScreenState>(
          builder: (context, registrationState, child) {
            return ModalProgressHUD(
              inAsyncCall:
                  Provider.of<RegistrationScreenState>(context).showSpinner,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: registrationState.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: registrationState.passwordController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password.',
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    registrationState.errorMessage,
                    style: textStyle(14, textColor: Colors.red),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    colour: Colors.blueAccent,
                    title: 'Register',
                    onPressed: () async {
                      if (registrationState.validateInputs()) {
                        registrationState.setShowSpinner(true);
                        registrationState.setErrorMessage('');

                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: registrationState.emailController.text,
                            password: registrationState.passwordController.text,
                          );
                          if (newUser.user != null) {
                            context.router.push(const LoginScreenRoute());
                          }
                        } catch (e) {
                          print(e);
                          registrationState.setErrorMessage(
                              'Registration failed. Try again.');
                        } finally {
                          registrationState.setShowSpinner(false);
                        }
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
