import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/router/route_names.dart';
import '../../utils/theme/theme_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        iconSize: 18,
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.theme.colorScheme.surfaceContainerHigh,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(Icons.arrow_back_ios),
        ),
        onPressed: () => context.go(AppRoutes.loginView),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
