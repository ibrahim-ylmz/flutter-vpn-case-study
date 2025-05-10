import 'package:equatable/equatable.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

class ConnectionStats extends Equatable {
  final int downloadSpeed;
  final int uploadSpeed;
  final Duration connectedTime;
  final Country? connectedCountry;

  const ConnectionStats({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    this.connectedCountry,
  });

  ConnectionStats copyWith({
    int? downloadSpeed,
    int? uploadSpeed,
    Duration? connectedTime,
    Country? connectedCountry,
  }) {
    return ConnectionStats(
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      connectedTime: connectedTime ?? this.connectedTime,
      connectedCountry: connectedCountry ?? this.connectedCountry,
    );
  }

  @override
  List<Object?> get props => [
    downloadSpeed,
    uploadSpeed,
    connectedTime,
    connectedCountry,
  ];
}
