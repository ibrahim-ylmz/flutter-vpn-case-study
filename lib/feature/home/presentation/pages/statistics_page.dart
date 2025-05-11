import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/core/utility/constants/app_constants.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/connection_info_card.dart';

@RoutePage()
/// Page that displays VPN connection statistics
final class StatisticsPage extends StatelessWidget {
  /// Constructor for [StatisticsPage]
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ConnectionStatusBloc, ConnectionStatusState>(
            builder: (context, state) {
              if (state is Connected) {
                return _buildConnectedStats(context, state);
              } else if (state is Connecting) {
                return _buildConnectingStats(context, state);
              } else {
                return _buildDisconnectedStats(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildConnectedStats(BuildContext context, Connected state) {
    return Column(
      children: [
        ConnectionInfoCard(stats: state.stats),
        const SizedBox(height: 24),
        _buildDisconnectButton(context),
      ],
    );
  }

  Widget _buildDisconnectButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.power_settings_new),
        label: const Text('Disconnect'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          context.read<ConnectionStatusBloc>().add(const DisconnectEvent());
        },
      ),
    );
  }

  Widget _buildConnectingStats(BuildContext context, Connecting state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(
            'Connecting to ${state.country.name}...',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildDisconnectedStats(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_off, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text(
            'Not Connected',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Connect to a VPN to view statistics',
            style: TextStyle(color: AppConstants.textGrey),
          ),
        ],
      ),
    );
  }
}
