import 'package:flutter/material.dart';

/// Base class for defining themes
abstract class IAppTheme {
  /// Main theme data for the app
  ThemeData get themeData;

  /// Floating action button theme data
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
  
  /// Card theme data for consistent card styling
  CardTheme get cardTheme;
  
  /// Text theme data for consistent text styling
  TextTheme get textTheme;
  
  /// App bar theme data
  AppBarTheme get appBarTheme;
  
  /// Input decoration theme for text fields
  InputDecorationTheme get inputDecorationTheme;
}
