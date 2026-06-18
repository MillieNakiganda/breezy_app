import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../../core/utils/router/route_names.dart';
import '../../../../core/utils/theme/app_sizes.dart';
import '../../../../core/utils/theme/app_spacing.dart';
import '../../../../core/utils/theme/theme_extensions.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  static const imageUrl =
      'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: context.theme.colorScheme.outlineVariant,
          width: AppSizes.cardBorderWidth,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(AppSpacing.sm),
        child: Row(
          children: [
            CardImage(),
            SizedBox(width: AppSpacing.sm),
            Flexible(child: CardContent()),
          ],
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCachedImageWidget(
      height: AppSizes.cardImageHeight,
      width: AppSizes.cardImageWidth,
      imageUrl: CardWidget.imageUrl,
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Sofia Vargas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: AppSizes.iconStarSm),
                const SizedBox(width: 2),
                Text(
                  '4.9 (200)',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text('Deep Clean . 2km away', style: context.theme.textTheme.bodySmall),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$32/hr',
              style: context.theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.appColors.successColor,
              ),
            ),
            AppButtonWidget(
              buttonWidth: AppSizes.buttonWidthSm,
              buttonHeight: AppSizes.buttonHeightSm,
              label: 'Book',
              backgroundColor: context.theme.colorScheme.secondary,
              labelColor: context.theme.colorScheme.onSecondary,
              onPressed: () => context.push(AppRoutes.cleanerDetailsView),
            ),
          ],
        ),
      ],
    );
  }
}
