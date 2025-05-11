import 'package:get_it/get_it.dart';
import 'package:vpn_case_study/feature/home/data/datasources/mock_vpn_datasource.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository_impl.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_bloc.dart';

/// This is the dependency injection container instance
final sl = GetIt.instance;

/// This method is used to initialize the dependency injection container
Future<void> init() async {
  sl
    ..registerFactory(() => CountryListBloc(sl()))
    ..registerFactory(() => ConnectionStatusBloc(sl()))
    ..registerLazySingleton<VpnRepository>(() => VpnRepositoryImpl(sl()))
    ..registerLazySingleton(MockVpnDataSource.new);
}
