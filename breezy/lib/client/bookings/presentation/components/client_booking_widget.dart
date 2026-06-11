import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../../core/utils/theme/theme_extensions.dart';

class ClientBookingWidget extends StatelessWidget {
  const ClientBookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.theme.colorScheme.surface,
      // margin: const EdgeInsets.only(top: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: context.theme.colorScheme.outlineVariant,
          width: 0.8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: AppCachedImageWidget(
                    height: 60,
                    width: 60,
                    imageUrl:
                        'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                  ),
                ),

                SizedBox(width: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sofia Vargas',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: context.appColors.warningContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, size: 12),
                                  Text('4.5'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Deep Clean . 2km away',
                        style: context.theme.textTheme.bodySmall,
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              //height: 1,
              thickness: 0.8,

              endIndent: 0,
              color: context.theme.colorScheme.outlineVariant,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(PhosphorIcons.calendarBlank, size: 14),
                      Text(
                        'Oct 02 . 9:00 AM',
                        style: context.theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    '\$32/hr',
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.appColors.successColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
