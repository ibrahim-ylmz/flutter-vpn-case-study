import 'package:auto_route/auto_route.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/home_page.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/main_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
/// Project router
final class AppRouter extends RootStackRouter {
  static const _replaceRouteName = 'Page,Route';
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
      path: '/',
      children: [AutoRoute(page: HomeRoute.page, path: 'home', initial: true)],
    ),
  ];
}
