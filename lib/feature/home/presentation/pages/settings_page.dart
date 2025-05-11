import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:vpn_case_study/feature/home/presentation/bloc/theme_bloc/theme_state.dart';

@RoutePage()
/// Page that displays VPN app settings
final class SettingsPage extends StatelessWidget {
  /// Constructor for [SettingsPage]
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildThemeToggleCard(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggleCard(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeMode == ThemeMode.dark;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(
                    (0.1 * 255).toInt(),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: theme.colorScheme.primary,
                ),
              ),
              title: Text('Dark Mode', style: theme.textTheme.titleMedium),
              subtitle: Text(
                isDarkMode ? 'Dark theme is enabled' : 'Light theme is enabled',
                style: theme.textTheme.bodyMedium,
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (_) {
                  context.read<ThemeBloc>().add(const ToggleThemeEvent());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
