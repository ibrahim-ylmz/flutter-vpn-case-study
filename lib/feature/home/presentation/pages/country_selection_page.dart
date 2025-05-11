import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_state.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/country_list_item.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/search_bar_widget.dart';

@RoutePage()
/// Country Selection Page and country list search page
class CountrySelectionPage extends StatefulWidget {
  /// Constructor
  const CountrySelectionPage({super.key});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// Focus the search bar when the page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country Selection'), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(context),
            const SizedBox(height: 16),
            _buildCountryList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return BlocBuilder<CountryListBloc, CountryListState>(
      builder: (context, state) {
        var initialQuery = '';
        if (state is CountryListLoaded) {
          initialQuery = state.searchQuery;
        }

        return SearchBarWidget(
          initialQuery: initialQuery,
          focusNode: _searchFocusNode,
          onSearch: (query) {
            context.read<CountryListBloc>().add(SearchCountryEvent(query));
          },
        );
      },
    );
  }

  Widget _buildCountryList(BuildContext context) {
    return BlocBuilder<CountryListBloc, CountryListState>(
      builder: (context, state) {
        if (state is CountryListInitial || state is CountryListLoading) {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CountryListLoaded) {
          final countries =
              state.searchQuery.isEmpty
                  ? state.countries
                  : state.filteredCountries;

          if (countries.isEmpty) {
            return const Expanded(
              child: Center(child: Text('No results found')),
            );
          }

          return Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return BlocBuilder<ConnectionStatusBloc, ConnectionStatusState>(
                  builder: (context, connectionState) {
                    var isConnected = false;

                    if (connectionState is Connected) {
                      isConnected =
                          connectionState.country.name == country.name;
                    } else if (connectionState is Connecting) {
                      isConnected =
                          connectionState.country.name == country.name;
                    }

                    return CountryListItem(
                      country: country,
                      isConnected: isConnected,
                      onTap: () {
                        if (isConnected && connectionState is Connected) {
                          context.read<ConnectionStatusBloc>().add(
                            const DisconnectEvent(),
                          );
                        } else {
                          context.read<ConnectionStatusBloc>().add(
                            ConnectToCountryEvent(country),
                          );
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                );
              },
            ),
          );
        } else if (state is CountryListError) {
          return Expanded(
            child: Center(child: Text('Error: ${state.message}')),
          );
        } else {
          return const Expanded(child: Center(child: Text('Unknown status')));
        }
      },
    );
  }
}
