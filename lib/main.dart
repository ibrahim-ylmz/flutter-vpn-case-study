import 'package:flutter/material.dart';
import 'package:vpn_case_study/core/init/application_initialize.dart';
import 'package:vpn_case_study/core/init/bloc_initialize.dart';
import 'package:vpn_case_study/core/init/theme/custom_dark_theme.dart';
import 'package:vpn_case_study/core/init/theme/custom_light_theme.dart';
import 'package:vpn_case_study/core/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().init();
  runApp(const BlocInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VPN Case Study',
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      routerConfig: _appRouter.config(),
    );
  }
}
