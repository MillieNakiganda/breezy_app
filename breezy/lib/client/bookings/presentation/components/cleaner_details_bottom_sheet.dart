import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/common_widgets/common_components/floating_bottom_sheet.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../../core/utils/router/route_names.dart';

Future<void> showApplicationBottomSheet(BuildContext context) {
  return showFloatingBottomSheet<void>(
    context: context,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FloatingBottomSheetHandle(),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: AppCachedImageWidget(
                              width: constraints.maxWidth * 0.32,
                              height: constraints.maxWidth * 0.32,
                              imageUrl: 'assets/images/person-1.jpeg',
                            ),
                          ),
                          const SizedBox(height: 8),

                          Text(
                            'Jane',
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 5.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            '200',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Reviews', style: context.textTheme.bodySmall),
                          SizedBox(height: 4),
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            child: Divider(
                              height: 1,
                              thickness: 0.8,

                              endIndent: 0,
                              color: context.theme.colorScheme.outlineVariant,
                            ),
                          ),
                          SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              text: '4.9',
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              children: const <WidgetSpan>[
                                WidgetSpan(child: Icon(Icons.star, size: 20)),
                              ],
                            ),
                          ),

                          Text('Rating', style: context.textTheme.bodySmall),
                          SizedBox(height: 4),
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            child: Divider(
                              height: 1,
                              thickness: 0.8,

                              endIndent: 0,
                              color: context.theme.colorScheme.outlineVariant,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '4',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Years on Breezy',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      // ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.',
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: 16),

              AppButtonWidget(
                label: 'View Profile',
                backgroundColor: context.theme.colorScheme.secondary,
                labelColor: context.theme.colorScheme.onSecondary,
                onPressed: () => context.push(AppRoutes.cleanerDetailsView),
              ),
            ],
          );
        },
      ),
    ),
  );
}
