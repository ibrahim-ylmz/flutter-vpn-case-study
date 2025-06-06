import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1A5CFF),
      surfaceTint: Color(0xFF1A5CFF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFD6E4FF),
      onPrimaryContainer: Color(0xFF001F38),
      secondary: Color(0xFF666666),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFDBE2F5),
      onSecondaryContainer: Color(0xFF333333),
      tertiary: Color(0xFF1A5CFF),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFDBE2FF),
      onTertiaryContainer: Color(0xFF001A41),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFF2F5F9),
      onSurface: Color(0xFF333333),
      onSurfaceVariant: Color(0xFF666666),
      outline: Color(0xFF666666),
      outlineVariant: Color(0xFFC4C6CF),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF333333),
      inversePrimary: Color(0xFFB2CBFF),
      primaryFixed: Color(0xFFD6E4FF),
      onPrimaryFixed: Color(0xFF001F38),
      primaryFixedDim: Color(0xFFAAC7FF),
      onPrimaryFixedVariant: Color(0xFF0042A4),
      secondaryFixed: Color(0xFFDBE2F5),
      onSecondaryFixed: Color(0xFF333333),
      secondaryFixedDim: Color(0xFFBFC6DB),
      onSecondaryFixedVariant: Color(0xFF666666),
      tertiaryFixed: Color(0xFFDBE2FF),
      onTertiaryFixed: Color(0xFF001A41),
      tertiaryFixedDim: Color(0xFFB2CBFF),
      onTertiaryFixedVariant: Color(0xFF004494),
      surfaceDim: Color(0xFFE0E3EA),
      surfaceBright: Color(0xFFF2F5F9),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF2F5F9),
      surfaceContainer: Color(0xFFEBEFF4),
      surfaceContainerHigh: Color(0xFFE3E8EE),
      surfaceContainerHighest: Color(0xFFDCE2E9),
    );
  }

  /// Dark color scheme set
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF1A5CFF),
      surfaceTint: Color(0xFFB2CBFF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF0042A4),
      onPrimaryContainer: Color(0xFFD6E4FF),
      secondary: Color(0xFFBFC6DB),
      onSecondary: Color(0xFF333333),
      secondaryContainer: Color(0xFF4A4D57),
      onSecondaryContainer: Color(0xFFDBE2F5),
      tertiary: Color(0xFFB2CBFF),
      onTertiary: Color(0xFF002B6C),
      tertiaryContainer: Color(0xFF004494),
      onTertiaryContainer: Color(0xFFDBE2FF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF121417),
      onSurface: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFFC4C6CF),
      outline: Color(0xFF8E9099),
      outlineVariant: Color(0xFF44474E),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFF2F5F9),
      inversePrimary: Color(0xFF1A5CFF),
      primaryFixed: Color(0xFFD6E4FF),
      onPrimaryFixed: Color(0xFF001F38),
      primaryFixedDim: Color(0xFFAAC7FF),
      onPrimaryFixedVariant: Color(0xFF0042A4),
      secondaryFixed: Color(0xFFDBE2F5),
      onSecondaryFixed: Color(0xFF1C2733),
      secondaryFixedDim: Color(0xFFBFC6DB),
      onSecondaryFixedVariant: Color(0xFF404B5A),
      tertiaryFixed: Color(0xFFDBE2FF),
      onTertiaryFixed: Color(0xFF001A41),
      tertiaryFixedDim: Color(0xFFB2CBFF),
      onTertiaryFixedVariant: Color(0xFF004494),
      surfaceDim: Color(0xFF121417),
      surfaceBright: Color(0xFF38393D),
      surfaceContainerLowest: Color(0xFF0D0F12),
      surfaceContainerLow: Color(0xFF171A1D),
      surfaceContainer: Color(0xFF1D1F23),
      surfaceContainerHigh: Color(0xFF282A2D),
      surfaceContainerHighest: Color(0xFF333438),
    );
  }
}
