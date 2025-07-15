import 'package:auto_route/auto_route.dart';
import 'package:code_base/core/local_cache/cache_utils.dart';

import '../app_router.gr.dart';


class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async{
    final cache = await CacheUtils.getInstance();
    final token = cache.getToken();

    if (token.isEmpty) {
      // Token missing, redirect to login
      router.push(
        const LoginRoute(),
      );
    } else {
      // Token exists, allow navigation
      resolver.next(true);
    }
  }
}
