import 'package:flutter/material.dart';

import '../../../../core/utils/theme/theme_extensions.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.review,
  });

  final String name;
  final String rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: context.theme.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rating,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(review, style: context.theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
