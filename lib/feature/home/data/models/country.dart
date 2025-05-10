import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String flag;
  final String city;
  final int locationCount;
  final int strength;
  final bool isConnected;

  const Country({
    required this.name,
    required this.flag,
    required this.city,
    required this.locationCount,
    required this.strength,
    this.isConnected = false,
  });

  Country copyWith({
    String? name,
    String? flag,
    String? city,
    int? locationCount,
    int? strength,
    bool? isConnected,
  }) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      city: city ?? this.city,
      locationCount: locationCount ?? this.locationCount,
      strength: strength ?? this.strength,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [name, flag, city, locationCount, strength, isConnected];
} 