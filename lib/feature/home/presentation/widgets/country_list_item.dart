import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case_study/feature/home/data/models/country.dart';

/// This is the country list item widget
/// It displays a country in the list
/// It contains the country name, the number of locations, and the connection button
class CountryListItem extends StatelessWidget {
  /// Constructor
  const CountryListItem({
    required this.country,
    required this.onTap,
    super.key,
    this.isConnected = false,
  });

  /// The country
  final Country country;

  /// The callback for the connection button
  final VoidCallback onTap;

  /// Whether the country is connected
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.asset(country.flag, height: 40, fit: BoxFit.cover),
        ),
        title: Row(
          children: [
            Text(
              country.name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              '${country.locationCount} Locations',
              style: theme.textTheme.bodyMedium,
            ),
            const Spacer(),
          ],
        ),
        trailing: _buildConnectionButton(context),
      ),
    );
  }

  Widget _buildConnectionButton(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color:
              isConnected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.power_settings_new_outlined,
                color:
                    isConnected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurfaceVariant,
                size: 25,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.onSurfaceVariant,
            size: 25,
          ),
        ),
      ],
    );
  }
}
