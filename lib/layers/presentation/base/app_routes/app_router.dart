import 'package:auto_route/auto_route.dart';
import 'package:posts_app/layers/presentation/base/app_routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', initial: true),
        // AutoRoute(page: LoginRoute.page, path: '/login'),
      ];
}

class AppRouterSingleton {
  factory AppRouterSingleton() {
    return _instance;
  }

  AppRouterSingleton._internal() {
    appRouter = AppRouter();
  }

  static final AppRouterSingleton _instance = AppRouterSingleton._internal();
  late final AppRouter appRouter;
}
