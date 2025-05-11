import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_case_study/core/navigation/app_router.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';

@RoutePage()
/// Main page of the app
final class MainPage extends StatelessWidget {
  /// Constructor for [MainPage]
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: const [HomeRoute(), StatisticsRoute(), SettingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar:
              BlocBuilder<ConnectionStatusBloc, ConnectionStatusState>(
                builder: (context, state) {
                  var statisticsLabel = 'Disconnected';
                  if (state is Connected) {
                    statisticsLabel = 'Connected';
                  } else if (state is Connecting) {
                    statisticsLabel = 'Connecting';
                  } else if (state is Disconnected) {
                    statisticsLabel = 'Disconnected';
                  }

                  return BottomNavigationBar(
                    backgroundColor:
                        theme.bottomNavigationBarTheme.backgroundColor,
                    elevation: 2,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    selectedItemColor: theme.colorScheme.primary,
                    unselectedItemColor: theme.colorScheme.onSurfaceVariant,
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/ic_map.svg',
                          height: 30,
                          colorFilter: ColorFilter.mode(
                            tabsRouter.activeIndex == 0
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Countries',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/ic_radar.svg',
                          height: 30,
                          colorFilter: ColorFilter.mode(
                            tabsRouter.activeIndex == 1
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: statisticsLabel,
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/icons/ic_setting.svg',
                          height: 30,
                          colorFilter: ColorFilter.mode(
                            tabsRouter.activeIndex == 2
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Setting',
                      ),
                    ],
                  );
                },
              ),
        );
      },
    );
  }
}
