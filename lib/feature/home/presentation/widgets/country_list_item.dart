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
        dense: true,
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.asset(country.flag, height: 37, fit: BoxFit.cover),
        ),
        title: Text(
          country.name,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '${country.locationCount} Locations',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w300,
          ),
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
        IconButton(
          onPressed: onTap,
          iconSize: 25,
          icon: Icon(
            Icons.power_settings_new_outlined,
            color:
                isConnected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
          ),
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor:
                isConnected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surfaceContainerHighest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(35, 35),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.onSurfaceVariant,
            size: 25,
          ),
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(35, 35),
          ),
        ),
      ],
    );
  }
}
