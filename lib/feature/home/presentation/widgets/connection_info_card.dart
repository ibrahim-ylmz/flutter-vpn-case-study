import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_case_study/feature/home/data/models/connection_stats.dart';

/// This is the connection info card widget
/// It displays the connection info of the user
/// It contains the country, the city, the speed and the stealth
final class ConnectionInfoCard extends StatelessWidget {
  /// Constructor
  const ConnectionInfoCard({required this.stats, super.key});

  /// The connection stats
  final ConnectionStats stats;

  @override
  Widget build(BuildContext context) {
    final country = stats.connectedCountry!;
    final theme = Theme.of(context);

    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                country.flag,
                height: 37,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              children: [
                Text(
                  country.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              country.city.isEmpty ? 'Unknown' : country.city,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Stealth',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '${stats.connectedCountry!.strength}%',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 3),
        _buildSpeedStats(context),
      ],
    );
  }

  Widget _buildSpeedStats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSpeedInfo(
            context: context,
            iconAsset: 'assets/icons/ic_import.svg',
            label: 'Download :',
            value: '${stats.downloadSpeed} MB',
            iconColor: const Color(0xFF00D589),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSpeedInfo(
            context: context,
            iconAsset: 'assets/icons/ic_export.svg',
            label: 'Upload :',
            value: '${stats.uploadSpeed} MB',
            iconColor: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildSpeedInfo({
    required BuildContext context,
    required String iconAsset,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Card(
      elevation: isDarkMode ? 0 : 1, 
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: iconColor.withAlpha((0.1 * 255).toInt()),
              ),
              child: SvgPicture.asset(
                iconAsset,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
