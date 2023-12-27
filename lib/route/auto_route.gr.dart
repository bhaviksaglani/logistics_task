// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart';
import 'package:logistics_test_app/screens/login_screen.dart';
import 'package:logistics_test_app/screens/signup_screen.dart';
import 'package:logistics_test_app/screens/welcome_screen.dart';

import '../screens/home_screen.dart';

abstract class $AppRouter extends RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    WelcomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WelcomeScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegistrationScreen(),
      );
    },
  };
}

/// generated route for
/// [WelcomeScreen]
class WelcomeScreenRoute extends PageRouteInfo<void> {
  const WelcomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// [RegistrationScreen]
class RegistrationScreenRoute extends PageRouteInfo<void> {
  const RegistrationScreenRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
