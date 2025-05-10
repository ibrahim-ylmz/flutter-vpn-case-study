import 'package:flutter/material.dart';
import 'package:vpn_case_study/core/init/theme/custom_color_scheme.dart';
import 'package:vpn_case_study/core/init/theme/custom_theme.dart';
import 'package:vpn_case_study/core/utility/constants/app_constants.dart';

/// Custom dark theme
final class CustomDarkTheme implements IAppTheme {
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.darkScheme(),
    scaffoldBackgroundColor: const Color(0xFF121417),
    cardTheme: cardTheme,
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.white70,
      backgroundColor: Color(0xFF1D1F23),
      elevation: 2,
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFF2C2E33)),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor;
        }
        return Colors.grey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppConstants.primaryColor.withAlpha((0.4 * 255).toInt());
        }
        return Colors.grey.withAlpha((0.4 * 255).toInt());
      }),
    ),
  );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      FloatingActionButtonThemeData(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  @override
  CardTheme get cardTheme => CardTheme(
    color: const Color(0xFF1D1F23),
    elevation: AppConstants.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8),
  );

  @override
  TextTheme get textTheme => const TextTheme(
    headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
    backgroundColor: Color(0xFF1D1F23),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    fillColor: const Color(0xFF282A2D),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      borderSide: const BorderSide(color: AppConstants.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    hintStyle: const TextStyle(color: Colors.white54),
  );
}
