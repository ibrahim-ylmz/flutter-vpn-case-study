import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/repositories/vpn_repository.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/connection_status/connection_status_state.dart';

/// This class is used to manage the connection status of the VPN
class ConnectionStatusBloc
    extends Bloc<ConnectionStatusEvent, ConnectionStatusState> {
  /// Constructor
  ConnectionStatusBloc(this._vpnRepository) : super(const ConnectionInitial()) {
    on<ConnectToCountryEvent>(_onConnectToCountry);
    on<DisconnectEvent>(_onDisconnect);
    on<UpdateStatsEvent>(_onUpdateStats);
    on<InitializeConnectionStatusEvent>(_onInitialize);
  }
  final VpnRepository _vpnRepository;
  StreamSubscription<ConnectionStats>? _statsSubscription;

  Future<void> _onInitialize(
    InitializeConnectionStatusEvent event,
    Emitter<ConnectionStatusState> emit,
  ) async {
    /// Get the current stats
    final stats = _vpnRepository.getCurrentStats();
    if (stats.connectedCountry != null) {
      emit(Connected(country: stats.connectedCountry!, stats: stats));

      /// Subscribe to the stats stream
      _subscribeToStatsStream();
    } else {
      emit(const Disconnected());
    }
  }

  Future<void> _onConnectToCountry(
    ConnectToCountryEvent event,
    Emitter<ConnectionStatusState> emit,
  ) async {
    emit(Connecting(event.country));

    try {
      await _vpnRepository.connectToCountry(event.country);

      /// Subscribe to the stats stream
      _subscribeToStatsStream();

      /// Get the current stats
      final stats = _vpnRepository.getCurrentStats();
      emit(Connected(country: event.country, stats: stats));
    } catch (e) {
      emit(ConnectionError('Connection error: $e'));
    }
  }

  /// Disconnect from the VPN
  Future<void> _onDisconnect(
    DisconnectEvent event,
    Emitter<ConnectionStatusState> emit,
  ) async {
    if (state is Connected || state is Connecting) {
      try {
        await _vpnRepository.disconnect();

        /// Cancel the stats stream subscription
        await _statsSubscription?.cancel();
        _statsSubscription = null;

        emit(const Disconnected());
      } catch (e) {
        emit(ConnectionError('Error disconnecting: $e'));
      }
    }
  }

  /// Update the stats
  void _onUpdateStats(
    UpdateStatsEvent event,
    Emitter<ConnectionStatusState> emit,
  ) {
    if (state is Connected) {
      final currentState = state as Connected;
      emit(currentState.copyWith(stats: event.stats));
    }
  }

  /// Subscribe to the stats stream
  void _subscribeToStatsStream() {
    // If there is already a subscription, cancel it
    _statsSubscription?.cancel();

    // Create a new subscription
    _statsSubscription = _vpnRepository.getConnectionStatsStream().listen((
      stats,
    ) {
      add(UpdateStatsEvent(stats));
    });
  }

  /// Close the bloc
  @override
  Future<void> close() {
    _statsSubscription?.cancel();
    return super.close();
  }
}
