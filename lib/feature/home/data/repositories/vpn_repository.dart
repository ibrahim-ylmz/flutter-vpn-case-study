import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

/// This abstract class is used to define the VPN repository
abstract class VpnRepository {
  /// This method is used to get all the countries
  Future<List<Country>> getAllCountries();

  /// This method is used to connect to a country
  Future<void> connectToCountry(Country country);

  /// This method is used to disconnect from a country
  Future<void> disconnect();

  /// This method is used to get the stats stream
  Stream<ConnectionStats> getConnectionStatsStream();

  /// This method is used to get the current stats
  ConnectionStats getCurrentStats();
}
