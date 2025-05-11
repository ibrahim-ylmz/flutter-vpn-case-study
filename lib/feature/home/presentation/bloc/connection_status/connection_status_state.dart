import 'package:equatable/equatable.dart';
import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

abstract class ConnectionStatusState extends Equatable {
  const ConnectionStatusState();

  @override
  List<Object?> get props => [];
}

class ConnectionInitial extends ConnectionStatusState {
  const ConnectionInitial();
}

class Connecting extends ConnectionStatusState {
  final Country country;

  const Connecting(this.country);

  @override
  List<Object?> get props => [country];
}

class Connected extends ConnectionStatusState {
  final Country country;
  final ConnectionStats stats;

  const Connected({required this.country, required this.stats});

  Connected copyWith({Country? country, ConnectionStats? stats}) {
    return Connected(
      country: country ?? this.country,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [country, stats];
}

class Disconnected extends ConnectionStatusState {
  const Disconnected();
}

class ConnectionError extends ConnectionStatusState {
  final String message;

  const ConnectionError(this.message);

  @override
  List<Object?> get props => [message];
}
