import 'package:equatable/equatable.dart';

abstract class CountryListEvent extends Equatable {
  const CountryListEvent();

  @override
  List<Object?> get props => [];
}

class LoadCountriesEvent extends CountryListEvent {
  const LoadCountriesEvent();
}

class SearchCountryEvent extends CountryListEvent {
  final String query;

  const SearchCountryEvent(this.query);

  @override
  List<Object?> get props => [query];
} 