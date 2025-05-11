import 'package:equatable/equatable.dart';
import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

abstract class ConnectionStatusEvent extends Equatable {
  const ConnectionStatusEvent();

  @override
  List<Object?> get props => [];
}

class ConnectToCountryEvent extends ConnectionStatusEvent {
  final Country country;

  const ConnectToCountryEvent(this.country);

  @override
  List<Object?> get props => [country];
}

class DisconnectEvent extends ConnectionStatusEvent {
  const DisconnectEvent();
}

class UpdateStatsEvent extends ConnectionStatusEvent {
  final ConnectionStats stats;

  const UpdateStatsEvent(this.stats);

  @override
  List<Object?> get props => [stats];
}

class InitializeConnectionStatusEvent extends ConnectionStatusEvent {
  const InitializeConnectionStatusEvent();
}
