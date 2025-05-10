import 'package:vpn_case_study/feature/home/datasources/mock_vpn_datasource.dart';
import 'package:vpn_case_study/feature/home/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/models/country.dart';
import 'package:vpn_case_study/feature/home/repositories/vpn_repository.dart';

/// This class is used to implement the VPN repository
class VpnRepositoryImpl implements VpnRepository {
  /// This constructor is used to initialize the VPN repository
  VpnRepositoryImpl(this._dataSource);
  final MockVpnDataSource _dataSource;

  @override
  Future<void> connectToCountry(Country country) {
    return _dataSource.connectToCountry(country);
  }

  @override
  Future<void> disconnect() {
    return _dataSource.disconnect();
  }

  @override
  Future<List<Country>> getAllCountries() async {
    return _dataSource.getAllCountries();
  }

  @override
  Stream<ConnectionStats> getConnectionStatsStream() {
    return _dataSource.getStatsStream();
  }

  @override
  ConnectionStats getCurrentStats() {
    return _dataSource.getCurrentStats();
  }
}
