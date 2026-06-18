import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../../core/utils/theme/app_sizes.dart';
import '../../../../core/utils/theme/app_spacing.dart';
import '../../../../core/utils/theme/theme_extensions.dart';

class ClientNavigationBar extends StatefulWidget {
  const ClientNavigationBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<ClientNavigationBar> createState() => _ClientNavigationBarState();
}

class _ClientNavigationBarState extends State<ClientNavigationBar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    currentIndex = widget.navigationShell.currentIndex;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: RepaintBoundary(
        child: SafeArea(
          child: Container(
            height: AppSizes.navBarHeight,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.onSurface.withValues(
                    alpha: 0.1,
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                clientNavItem(PhosphorIcons.house, 'Home', 0),
                clientNavItem(PhosphorIcons.calendarBlank, 'Bookings', 1),
                clientNavItem(PhosphorIcons.clock, 'History', 2),
                clientNavItem(PhosphorIcons.user, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clientNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.outline,
          ),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: currentIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: currentIndex == index
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
