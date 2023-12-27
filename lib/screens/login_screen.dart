import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logistics_test_app/route/auto_route.gr.dart';
import 'package:logistics_test_app/utils/constants.dart';
import '../business_logic/view_models/login_vm.dart';
import '../utils/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  LoginViewModel? loginViewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Consumer<LoginViewModel>(
            builder: (context, loginState, child) {
              return ModalProgressHUD(
                inAsyncCall: loginState.showSpinner,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: textStyle(15, textColor: Colors.black),
                      onChanged: (value) {
                        loginState.setEmail(value);
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: textStyle(15, textColor: Colors.black),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        loginState.setPassword(value);
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password.',
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      loginState.errorMessage,
                      style: textStyle(12, textColor: Colors.red),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    RoundedButton(
                      colour: Colors.lightBlueAccent,
                      title: 'Log In',
                      onPressed: () async {
                        if (loginState.email.isEmpty ||
                            loginState.password.isEmpty) {
                          loginState.setErrorMessage(
                              'Email and password cannot be empty');
                          return;
                        }

                        loginState.setShowSpinner(true);
                        loginState.setErrorMessage('');

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                            email: loginState.email,
                            password: loginState.password,
                          );
                          if (user.user != null) {
                            context.router.replace(const HomeScreenRoute());
                          }
                        } catch (e) {
                          print(".....$e");
                          loginState
                              .setErrorMessage('Invalid email or password');
                        } finally {
                          loginState.setShowSpinner(false);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
