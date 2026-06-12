import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/theme/theme_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title ?? '',
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: context.theme.colorScheme.onSurface,
        ),
      ),
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
        onPressed: () => context.pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
