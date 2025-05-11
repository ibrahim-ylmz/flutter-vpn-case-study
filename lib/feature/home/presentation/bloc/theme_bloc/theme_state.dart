import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Class representing the theme state
class ThemeState extends Equatable {

  /// Constructor for dark theme
  const ThemeState.dark() : themeMode = ThemeMode.dark;

  /// Constructor for light theme
  const ThemeState.light() : themeMode = ThemeMode.light;
  /// The currently active theme mode
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
} 