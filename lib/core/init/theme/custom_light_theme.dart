import 'package:flutter/material.dart';
import 'package:vpn_case_study/core/init/theme/custom_color_scheme.dart';
import 'package:vpn_case_study/core/init/theme/custom_theme.dart';
import 'package:vpn_case_study/core/utility/constants/app_constants.dart';

/// Custom Light Theme
final class CustomLightTheme implements IAppTheme {
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightScheme(),
    scaffoldBackgroundColor: AppConstants.backgroundColor,
    cardTheme: cardTheme,
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: AppConstants.textWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: AppConstants.textDark,
      backgroundColor: Colors.white,
      elevation: 2,
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFFE0E0E0)),
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
        foregroundColor: AppConstants.textWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  @override
  CardTheme get cardTheme => CardTheme(
    color: Colors.white,
    elevation: AppConstants.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8),
  );

  @override
  TextTheme get textTheme => const TextTheme(
    headlineLarge: TextStyle(
      color: AppConstants.textDark,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppConstants.textDark,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: AppConstants.textDark,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: AppConstants.textDark,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(color: AppConstants.textDark),
    bodyMedium: TextStyle(color: AppConstants.textGrey),
  );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppConstants.textDark,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: AppConstants.textDark),
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    fillColor: Colors.white,
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
    hintStyle: const TextStyle(color: Colors.grey),
  );
}
