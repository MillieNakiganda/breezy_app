import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/router/route_names.dart';
import '../../../../utils/theme/theme_extensions.dart';
import '../../domain/onboarding_item.dart';
import 'title_description_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.go(AppRoutes.loginView);
            },
            child: Text('Skip', style: context.textTheme.bodyLarge),
          ),
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
