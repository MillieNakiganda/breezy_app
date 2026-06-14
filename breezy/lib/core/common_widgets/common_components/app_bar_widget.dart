import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/theme_extensions.dart';
import 'app_button_icon_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.title, this.trailingWidget = false});
  final String? title;
  final bool trailingWidget;

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
      actionsPadding: EdgeInsets.only(right: 20),
      actions: trailingWidget
          ? [
              AppIconButtonWidget(
                icon: Icon(PhosphorIcons.plus, color: Colors.white),
                buttonHeight: 40,
                buttonWidth: 1.5.w,
                label: 'Add',
                onPressed: () {},
                backgroundColor: context.theme.colorScheme.primary,
              ),
            ]
          : [],
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
