import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/core/navigation/app_router.dart';
import 'package:vpn_case_study/core/utility/constants/app_constants.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/country_list/country_list_state.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/connection_info_card.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/connection_timer.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/country_list_item.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/home_header.dart';

@RoutePage()
/// This is the home page of the app
final class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Home Header
          HomeHeader(
            onCategoryPressed: () {},
            onPremiumPressed: () {},
            onSearchPressed:
                () => context.router.push(const CountrySelectionRoute()),
          ),

          /// Connection Info Card
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Connection Info Card
                Expanded(child: _buildConnectionInfoCard()),

                /// Free Locations List
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: _buildFreeLocationsList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionInfoCard() {
    return BlocBuilder<ConnectionStatusBloc, ConnectionStatusState>(
      builder: (context, state) {
        if (state is Connecting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _rotationController,
                  child: Image.asset(
                    'assets/images/img_world.png',
                    height: 120,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Connecting...'),
              ],
            ),
          );
        } else if (state is Connected) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConnectionTimer(duration: state.stats.connectedTime),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ConnectionInfoCard(stats: state.stats),
              ),
            ],
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img_world.png', height: 120),
                const SizedBox(height: 16),
                const Text('You are not connected'),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildFreeLocationsList() {
    return BlocBuilder<CountryListBloc, CountryListState>(
      builder: (context, state) {
        if (state is CountryListInitial || state is CountryListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CountryListLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildFreeLocationsHeader(state, context),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.freeLocations.length,
                  itemBuilder: (context, index) {
                    final country = state.freeLocations[index];
                    return _buildCountryItem(country);
                  },
                ),
              ),
            ],
          );
        } else if (state is CountryListError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  Row _buildFreeLocationsHeader(CountryListLoaded state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Free Locations (${state.freeLocations.length})',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppConstants.textGrey,
          ),
        ),
        const Icon(Icons.info, color: AppConstants.textGrey),
      ],
    );
  }

  Widget _buildCountryItem(Country country) {
    return BlocBuilder<ConnectionStatusBloc, ConnectionStatusState>(
      builder: (context, state) {
        var isConnected = false;

        if (state is Connected) {
          isConnected = state.country.name == country.name;
        }

        return CountryListItem(
          country: country,
          isConnected: isConnected,
          onTap: () {
            if (isConnected) {
              context.read<ConnectionStatusBloc>().add(const DisconnectEvent());
            } else {
              context.read<ConnectionStatusBloc>().add(
                ConnectToCountryEvent(country),
              );
            }
          },
        );
      },
    );
  }
}
