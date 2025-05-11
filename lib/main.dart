import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/core/init/application_initialize.dart';
import 'package:vpn_case_study/core/init/bloc_initialize.dart';
import 'package:vpn_case_study/core/init/theme/custom_dark_theme.dart';
import 'package:vpn_case_study/core/init/theme/custom_light_theme.dart';
import 'package:vpn_case_study/core/navigation/app_router.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_state.dart';

Future<void> main() async {
  await ApplicationInitialize().init();
  runApp(const BlocInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'VPN Case Study',
          themeMode: state.themeMode,
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
