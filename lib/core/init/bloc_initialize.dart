import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/core/init/di/injection_container.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_bloc.dart';

/// This class is used to initialize the Bloc providers
class BlocInitialize extends StatelessWidget {
  /// This class is used to initialize the Bloc providers
  const BlocInitialize({required this.child, super.key});

  /// This method is used to initialize the Bloc providers
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryListBloc>(
          create: (_) => sl<CountryListBloc>()..add(const LoadCountriesEvent()),
        ),
        BlocProvider<ConnectionStatusBloc>(
          create:
              (_) =>
                  sl<ConnectionStatusBloc>()
                    ..add(const InitializeConnectionStatusEvent()),
        ),
        BlocProvider<ThemeBloc>(create: (_) => sl<ThemeBloc>()),
      ],
      child: child,
    );
  }
}
