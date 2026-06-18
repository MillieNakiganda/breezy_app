import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class StatsBox extends StatelessWidget {
  const StatsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          // color: context.theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.theme.colorScheme.outlineVariant,
            width: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '4.9',
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Rating', style: context.theme.textTheme.bodyMedium),
                ],
              ),
              Container(
                height: 30,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: context.theme.colorScheme.outlineVariant,
              ),
              Column(
                children: [
                  Text(
                    '126',
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Jobs', style: context.theme.textTheme.bodyMedium),
                ],
              ),
              Container(
                height: 30,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: context.theme.colorScheme.outlineVariant,
              ),
              Column(
                children: [
                  Text(
                    '3yrs',
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('on Breezy', style: context.theme.textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
