import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/onboarding_item.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.description,
    required this.imagePath,
    required this.titleParts,
    required this.index,
  });

  final String imagePath;
  final String description;
  final List<OnboardingTitlePart> titleParts;
  final int index;

  static const Color highlightColor = Color(0xFFE68A2E);
  static const Color normalColor = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text('Skip', style: TextStyle(fontSize: 16)),
        ),
        if (index == 1) ...[
          SizedBox(height: 60),
          TitleDescriptionWidget(
            titleParts: titleParts,
            description: description,
          ),
          Expanded(flex: 2, child: SvgPicture.asset(imagePath)),
        ] else ...[
          Expanded(flex: 2, child: SvgPicture.asset(imagePath)),
          TitleDescriptionWidget(
            titleParts: titleParts,
            description: description,
          ),
        ],
      ],
    );
  }
}

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    super.key,
    required this.titleParts,
    required this.description,
  });

  final List<OnboardingTitlePart> titleParts;
  final String description;

  static const Color highlightColor = Color(0xFFE68A2E);
  static const Color normalColor = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 32,
              height: 1.15,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: normalColor,
            ),
            children: titleParts
                .map(
                  (part) => TextSpan(
                    text: part.text,
                    style: TextStyle(
                      color: part.highlighted ? highlightColor : normalColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
        Text(description),
      ],
    );
  }
}
