import 'package:flutter/material.dart';

/// A dialog that shows premium features and options
class PremiumDialog extends StatelessWidget {
  /// Constructor
  const PremiumDialog({super.key});

  /// Static method to show the dialog
  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const PremiumDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryColor, primaryColor.withAlpha((0.8 * 255).toInt())],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Premium Features',
              style: TextStyle(
                color: onPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildFeatureItem(
              context: context,
              icon: Icons.speed,
              title: 'Faster Connection',
              description: 'Up to 10x faster than free plan',
            ),
            const SizedBox(height: 16),
            _buildFeatureItem(
              context: context,
              icon: Icons.security,
              title: 'Enhanced Security',
              description: 'Advanced encryption protocols',
            ),
            const SizedBox(height: 16),
            _buildFeatureItem(
              context: context,
              icon: Icons.language,
              title: 'All Locations',
              description: 'Access to all premium locations',
            ),
            const SizedBox(height: 16),
            _buildFeatureItem(
              context: context,
              icon: Icons.devices,
              title: 'Multiple Devices',
              description: 'Connect up to 5 devices simultaneously',
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF185BFF),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Upgrade Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
  }) {
    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: onPrimaryColor.withAlpha((0.2 * 255).toInt()),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: onPrimaryColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: onPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  color: onPrimaryColor.withAlpha((0.8 * 255).toInt()),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
