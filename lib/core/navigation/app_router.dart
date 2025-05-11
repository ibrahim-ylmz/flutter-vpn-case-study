import 'package:auto_route/auto_route.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/country_selection_page.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/home_page.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/main_page.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/settings_page.dart';
import 'package:vpn_case_study/feature/home/presentation/pages/statistics_page.dart';
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
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: StatisticsRoute.page, path: 'statistics'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
    AutoRoute(page: CountrySelectionRoute.page, path: '/country-selection'),
  ];
}
