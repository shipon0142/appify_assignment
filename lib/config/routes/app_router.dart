import 'package:auto_route/auto_route.dart';
import 'package:code_base/config/routes/guard/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          guards: [AuthGuard()],
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: DashboardRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: LoginRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: CreatePollPostRoute.page,
        ),
      ];
}
