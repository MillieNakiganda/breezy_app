import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    setState(() => currentIndex = index);
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: context.theme.colorScheme.onSurface.withValues(
                  alpha: 0.1,
                ),
                blurRadius: 20,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              clientNavItem(Icons.home, 'Home', 0),
              clientNavItem(Icons.book, 'Bookings', 1),
              clientNavItem(Icons.history, 'History', 2),
              clientNavItem(Icons.person, 'Profile', 3),
            ],
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
            style: TextStyle(
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
