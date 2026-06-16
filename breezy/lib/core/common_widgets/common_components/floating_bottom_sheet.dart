import 'package:flutter/material.dart';

import '../../utils/theme/theme_extensions.dart';

Future<T?> showFloatingBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  EdgeInsetsGeometry margin = const EdgeInsets.fromLTRB(16, 0, 16, 16),
  double borderRadius = 28,
  Color? barrierColor,
  bool isDismissible = true,
  bool enableDrag = true,

  bool useRootNavigator = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    useRootNavigator: useRootNavigator,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.5),
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: (context) {
      final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

      return Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        //duration: const Duration(milliseconds: 150),
        // curve: Curves.easeOut,
        child: Padding(
          padding: margin,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: SafeArea(top: false, child: child),
          ),
        ),
      );
    },
  );
}

class FloatingBottomSheetHandle extends StatelessWidget {
  const FloatingBottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
