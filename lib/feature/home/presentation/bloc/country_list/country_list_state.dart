import 'package:equatable/equatable.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

abstract class CountryListState extends Equatable {
  const CountryListState();

  @override
  List<Object?> get props => [];
}

class CountryListInitial extends CountryListState {
  const CountryListInitial();
}

class CountryListLoading extends CountryListState {
  const CountryListLoading();
}

class CountryListLoaded extends CountryListState {
  final List<Country> countries;
  final List<Country> freeLocations;
  final String searchQuery;
  final List<Country> filteredCountries;

  const CountryListLoaded({
    required this.countries,
    required this.freeLocations,
    this.searchQuery = '',
    List<Country>? filteredCountries,
  }) : filteredCountries = filteredCountries ?? countries;

  CountryListLoaded copyWith({
    List<Country>? countries,
    List<Country>? freeLocations,
    String? searchQuery,
    List<Country>? filteredCountries,
  }) {
    return CountryListLoaded(
      countries: countries ?? this.countries,
      freeLocations: freeLocations ?? this.freeLocations,
      searchQuery: searchQuery ?? this.searchQuery,
      filteredCountries: filteredCountries ?? this.filteredCountries,
    );
  }

  @override
  List<Object?> get props => [
    countries,
    freeLocations,
    searchQuery,
    filteredCountries,
  ];
}

class CountryListError extends CountryListState {
  final String message;

  const CountryListError(this.message);

  @override
  List<Object?> get props => [message];
}
