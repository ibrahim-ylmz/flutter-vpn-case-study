import 'package:flutter/material.dart';
import 'package:vpn_case_study/core/init/application_initialize.dart';
import 'package:vpn_case_study/core/init/bloc_initialize.dart';

Future<void> main() async {
  await ApplicationInitialize().init();
  runApp(const BlocInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN Case Study',
      home: Placeholder(),
    );
  }
}
