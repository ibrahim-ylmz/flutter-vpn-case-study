import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case_study/core/widget/app_bar_item_button.dart';
import 'package:vpn_case_study/feature/home/presentation/widgets/search_bar_widget.dart';

/// This is the header of the home page
/// It contains the category button, the premium button and the search bar
final class HomeHeader extends StatelessWidget {
  /// Constructor
  const HomeHeader({
    required this.onCategoryPressed,
    required this.onPremiumPressed,
    required this.onSearchPressed,
    super.key,
  });

  /// The callback for the category button
  final VoidCallback onCategoryPressed;

  /// The callback for the premium button
  final VoidCallback onPremiumPressed;

  /// The callback for the search bar
  final VoidCallback onSearchPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                'assets/images/svg_frame.svg',
                width: screenWidth * 0.5,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.045,
            child: Opacity(
              opacity: 0.5,
              child: RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  'assets/images/svg_frame.svg',
                  width: screenWidth * 0.55,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              bottom: 32,
              top: 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarItemButton(
                      iconPath: 'assets/icons/ic_category.svg',
                      onPressed: onCategoryPressed,
                    ),

                    // Countries title
                    Expanded(
                      child: Text(
                        'Countries',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    AppBarItemButton(
                      iconPath: 'assets/icons/ic_premium.svg',
                      onPressed: onPremiumPressed,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                InkWell(
                  onTap: onSearchPressed,
                  child: AbsorbPointer(
                    child: SearchBarWidget(onSearch: (_) {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
