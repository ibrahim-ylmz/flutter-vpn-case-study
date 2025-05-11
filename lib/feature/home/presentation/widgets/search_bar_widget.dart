import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_case_study/core/utility/constants/app_constants.dart';

/// This is the search bar widget
/// It is used to search for a country or a city
class SearchBarWidget extends StatefulWidget {
  /// Constructor
  const SearchBarWidget({
    required this.onSearch,
    super.key,
    this.initialQuery = '',
    this.focusNode,
  });

  /// The callback for the search bar
  final void Function(String) onSearch;

  /// The initial query
  final String initialQuery;

  /// The focus node
  final FocusNode? focusNode;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      onChanged: widget.onSearch,
      style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
      decoration: InputDecoration(
        hintText: 'Search For Country Or City',
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          fontSize: 18,
          color: theme.hintColor,
        ),
        suffixIcon: SvgPicture.asset(
          'assets/icons/ic_search.svg',
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 45,
          minHeight: 45,
        ),
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor,
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        isDense: true,
      ),
    );
  }
}
