import 'dart:async';
import 'dart:math';

import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

/// This class is used to mock the VPN datasource
class MockVpnDataSource {
  Country? _connectedCountry;
  DateTime? _connectionStartTime;
  final _statsController = StreamController<ConnectionStats>.broadcast();
  Timer? _timer;

  final List<Country> _mockCountries = [
    const Country(
      name: 'Italy',
      flag: 'assets/images/svg_italy.svg',
      city: '',
      locationCount: 4,
      strength: 70,
    ),
    const Country(
      name: 'Netherlands',
      flag: 'assets/images/svg_netherlands.svg',
      city: 'Amsterdam',
      locationCount: 12,
      strength: 85,
    ),
    const Country(
      name: 'Germany',
      flag: 'assets/images/svg_germany.svg',
      city: '',
      locationCount: 10,
      strength: 90,
    ),
  ];

  /// This method is used to get all the countries
  List<Country> getAllCountries() {
    return List.from(_mockCountries);
  }

  /// This method is used to connect to a country
  Future<void> connectToCountry(Country country) async {
    /// This is a mock delay to simulate the connection time
    await Future<void>.delayed(const Duration(seconds: 2));
    _connectedCountry = country;
    _connectionStartTime = DateTime.now();

    /// This is a mock timer to update the stats
    _startStatsUpdates();
    return;
  }

  /// This method is used to disconnect from a country
  Future<void> disconnect() async {
    /// This is a mock delay to simulate the disconnection time
    await Future<void>.delayed(const Duration(seconds: 1));
    _connectedCountry = null;
    _connectionStartTime = null;
    _stopStatsUpdates();
    return;
  }

  /// This method is used to get the stats stream
  Stream<ConnectionStats> getStatsStream() {
    return _statsController.stream;
  }

  /// This method is used to get the current stats
  ConnectionStats getCurrentStats() {
    if (_connectedCountry == null || _connectionStartTime == null) {
      return const ConnectionStats(
        downloadSpeed: 0,
        uploadSpeed: 0,
        connectedTime: Duration.zero,
        connectedCountry: null,
      );
    }

    return ConnectionStats(
      downloadSpeed: _generateRandomSpeed(400, 600),
      uploadSpeed: _generateRandomSpeed(40, 60),
      connectedTime: DateTime.now().difference(_connectionStartTime!),
      connectedCountry: _connectedCountry,
    );
  }

  /// This method is used to start the stats updates
  void _startStatsUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final stats = getCurrentStats();
      _statsController.add(stats);
    });
  }

  /// This method is used to stop the stats updates
  void _stopStatsUpdates() {
    _timer?.cancel();
    _statsController.add(
      const ConnectionStats(
        downloadSpeed: 0,
        uploadSpeed: 0,
        connectedTime: Duration.zero,
        connectedCountry: null,
      ),
    );
  }

  /// This method is used to generate a random speed  
  int _generateRandomSpeed(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  /// This method is used to dispose the datasource
  void dispose() {
    _timer?.cancel();
    _statsController.close();
  }
}
