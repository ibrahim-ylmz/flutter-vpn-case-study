import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_state.dart';

/// This class is used to manage the country list
class CountryListBloc extends Bloc<CountryListEvent, CountryListState> {
  /// Constructor
  CountryListBloc(this._vpnRepository) : super(const CountryListInitial()) {
    on<LoadCountriesEvent>(_onLoadCountries);
    on<SearchCountryEvent>(_onSearchCountry);
  }
  final VpnRepository _vpnRepository;

  /// Load the countries
  Future<void> _onLoadCountries(
    LoadCountriesEvent event,
    Emitter<CountryListState> emit,
  ) async {
    emit(const CountryListLoading());
    try {
      final countries = await _vpnRepository.getAllCountries();

      emit(CountryListLoaded(countries: countries, freeLocations: countries));
    } catch (e) {
      emit(CountryListError('Error loading countries: $e'));
    }
  }

  /// Search the country
  void _onSearchCountry(
    SearchCountryEvent event,
    Emitter<CountryListState> emit,
  ) {
    if (state is CountryListLoaded) {
      final currentState = state as CountryListLoaded;
      final query = event.query.toLowerCase();

      if (query.isEmpty) {
        emit(
          currentState.copyWith(
            searchQuery: '',
            filteredCountries: currentState.countries,
          ),
        );
        return;
      }

      final filteredCountries =
          currentState.countries
              .where(
                (country) =>
                    country.name.toLowerCase().contains(query) ||
                    (country.city.isNotEmpty &&
                        country.city.toLowerCase().contains(query)),
              )
              .toList();

      emit(
        currentState.copyWith(
          searchQuery: event.query,
          filteredCountries: filteredCountries,
        ),
      );
    }
  }
}
