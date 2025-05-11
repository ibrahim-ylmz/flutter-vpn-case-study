import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_state.dart';

import 'country_list_bloc_test.mocks.dart';

@GenerateMocks([VpnRepository])
void main() {
  group('CountryListBloc', () {
    late MockVpnRepository mockVpnRepository;
    late CountryListBloc countryListBloc;
    
    final mockCountries = [
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
    ];

    setUp(() {
      mockVpnRepository = MockVpnRepository();
      when(mockVpnRepository.getAllCountries())
          .thenAnswer((_) async => mockCountries);
          
      countryListBloc = CountryListBloc(mockVpnRepository);
    });

    tearDown(() {
      countryListBloc.close();
    });

    test('initial state is CountryListInitial', () {
      expect(countryListBloc.state, const CountryListInitial());
    });

    blocTest<CountryListBloc, CountryListState>(
      'emits [CountryListLoading, CountryListLoaded] when LoadCountriesEvent is added',
      build: () => countryListBloc,
      act: (bloc) => bloc.add(const LoadCountriesEvent()),
      expect: () => [
        const CountryListLoading(),
        CountryListLoaded(
          countries: mockCountries,
          freeLocations: mockCountries,
          filteredCountries: mockCountries,
        ),
      ],
      verify: (_) {
        verify(mockVpnRepository.getAllCountries()).called(1);
      },
    );
  });
} 