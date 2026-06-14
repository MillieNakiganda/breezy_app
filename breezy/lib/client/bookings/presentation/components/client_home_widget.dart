import 'package:flutter/material.dart';

import '../../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../../core/utils/theme/theme_extensions.dart';

class ClientHomeWidget extends StatelessWidget {
  const ClientHomeWidget({super.key});

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
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: AppCachedImageWidget(
                    height: 60,
                    width: 60,
                    imageUrl:
                        'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                  ),
                ),

                SizedBox(width: 8),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brooklyn Aptment',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          SizedBox(height: 4),
                          Text(
                            '112 Henry St, Apt 4B',
                            style: context.theme.textTheme.bodySmall,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Brooklyn, NY 11201',
                            style: context.theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.delete,
                        color: context.theme.colorScheme.error,
                      ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 beds . 1 bath . 820ft',
                  style: context.theme.textTheme.bodySmall,
                ),

                SizedBox(
                  height: 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    ),
                    onPressed: null,
                    child: Text(
                      'Edit',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
