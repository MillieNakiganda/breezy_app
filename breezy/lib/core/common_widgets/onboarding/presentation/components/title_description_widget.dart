import 'package:flutter/material.dart';

import '../../../../utils/theme/theme_extensions.dart';
import '../../domain/onboarding_item.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    super.key,
    required this.titleParts,
    required this.description,
  });

  final List<OnboardingTitlePart> titleParts;
  final String description;

  static const Color normalColor = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: context.textTheme.displaySmall?.copyWith(
              color: normalColor,
              fontWeight: FontWeight.bold,
            ),

            children: titleParts
                .map(
                  (part) => TextSpan(
                    text: part.text,
                    style: context.textTheme.displaySmall?.copyWith(
                      color: part.highlighted
                          ? context.theme.colorScheme.primary
                          : normalColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
        Text(description, style: context.textTheme.bodyLarge),
      ],
    );
  }
}
