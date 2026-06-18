import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_sizes.dart';
import '../../../../core/utils/theme/app_spacing.dart';
import '../../../../core/utils/theme/theme_extensions.dart';

class ServiceChipWidget extends StatelessWidget {
  const ServiceChipWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final outlineVariant = context.theme.colorScheme.outlineVariant;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: outlineVariant,
          width: AppSizes.cardBorderWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Text(label, style: context.theme.textTheme.bodySmall),
      ),
    );
  }
}
