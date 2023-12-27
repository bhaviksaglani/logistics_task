import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logistics_test_app/route/auto_route.gr.dart';
import 'package:logistics_test_app/utils/constants.dart';
import '../utils/rounded_button.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Welcome Header
            Text(
              'Welcome to My App',
              style: textStyle(
                24.0,
                textFontWeight: FontWeight.bold,
                textColor: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // Log In Button
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                context.router.push(const LoginScreenRoute());
              },
            ),

            // Register Button
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                context.router.push(const RegistrationScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
