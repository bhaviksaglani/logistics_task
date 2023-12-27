import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/welcome_screen',
          page: WelcomeScreenRoute.page,
        ),
        AutoRoute(
          path: '/login_screen',
          page: LoginScreenRoute.page,
        ),
        AutoRoute(
          path: '/home_screen',
          page: HomeScreenRoute.page,
        ),
        AutoRoute(
          path: '/registration_screen',
          page: RegistrationScreenRoute.page,
        ),
      ];
}
