import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This widget displays a rounded blue button with an SVG icon.
class AppBarItemButton extends StatelessWidget {
  /// Constructor
  const AppBarItemButton({
    required this.iconPath,
    super.key,
    this.onPressed,
    this.width = 50,
    this.height = 50,
    this.backgroundColor = const Color(0xFF3B74FF),
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 12,
  });

  /// The SVG asset path for the icon to display
  final String iconPath;

  /// Optional callback when the button is pressed
  final VoidCallback? onPressed;

  /// Optional width for the button (defaults to 40)
  final double width;

  /// Optional height for the button (defaults to 40)
  final double height;

  /// Optional background color (defaults to #3B74FF)
  final Color backgroundColor;

  /// Optional padding (defaults to 8px)
  final EdgeInsetsGeometry padding;

  /// Optional border radius (defaults to 12px)
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
