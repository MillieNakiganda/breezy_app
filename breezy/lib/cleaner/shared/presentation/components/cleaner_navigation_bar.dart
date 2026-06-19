import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../../core/utils/theme/theme_extensions.dart';

class CleanerNavigationBar extends StatefulWidget {
  const CleanerNavigationBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<CleanerNavigationBar> createState() => _CleanerNavigationBarState();
}

class _CleanerNavigationBarState extends State<CleanerNavigationBar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() => currentIndex = index);
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: RepaintBoundary(
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: colorTheme.onSurface.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cleanerNavItem(PhosphorIcons.house, 'Home', 0),
                cleanerNavItem(PhosphorIcons.calendarBlank, 'Schedule', 1),
                cleanerNavItem(PhosphorIcons.trendUp, 'Earnings', 2),
                cleanerNavItem(PhosphorIcons.user, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cleanerNavItem(IconData icon, String label, int index) {
    final textTheme = context.textTheme;
    final colorTheme = context.theme.colorScheme;
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index
                ? colorTheme.primary
                : colorTheme.outline,
          ),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: currentIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: currentIndex == index
                  ? colorTheme.primary
                  : colorTheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
