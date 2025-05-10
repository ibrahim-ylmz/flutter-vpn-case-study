import 'package:vpn_case_study/feature/home/models/country.dart';

/// This class is used to mock the VPN datasource
class MockVpnDataSource {
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
}
