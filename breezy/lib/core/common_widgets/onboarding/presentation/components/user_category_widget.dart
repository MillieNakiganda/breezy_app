import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/theme_extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.context,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final BuildContext context;
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 38.w,
            height: 16.h,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.theme.colorScheme.primaryContainer
                  : context.theme.colorScheme.surfaceContainerHigh,

              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.transparent, width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(image, height: 90, width: 90),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    label,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.colorScheme.surface,
                  border: Border.all(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.check_sharp,
                  color: context.theme.colorScheme.primary,
                  size: 28,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
