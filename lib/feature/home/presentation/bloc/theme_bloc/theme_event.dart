import 'package:equatable/equatable.dart';

/// Base class for all theme events
abstract class ThemeEvent extends Equatable {
  /// Constructor for [ThemeEvent]
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Event to toggle between light and dark theme
class ToggleThemeEvent extends ThemeEvent {
  /// Constructor for [ToggleThemeEvent]
  const ToggleThemeEvent();
} 