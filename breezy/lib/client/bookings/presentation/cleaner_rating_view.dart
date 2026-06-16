import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/common_widgets/common_components/app_cached_image_widget.dart';
import 'package:breezy/core/common_widgets/common_components/app_text_field.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';

class CleanerRatingView extends StatefulWidget {
  const CleanerRatingView({super.key});

  @override
  State<CleanerRatingView> createState() => _CleanerRatingViewState();
}

class _CleanerRatingViewState extends State<CleanerRatingView> {
  final commentTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Rate Cleaner'),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 32,
                      top: 16,
                      //bottom: 40,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: AppCachedImageWidget(
                            height: 80,
                            width: 80,
                            imageUrl: '',
                          ),
                        ),

                        Text(
                          'Sofia Carrera',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          textAlign: TextAlign.center,
                          "2hr. Deep Clean. Tue, Oct 15",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                        SizedBox(height: 32),

                        Text(
                          textAlign: TextAlign.start,
                          "On a scale of 1-5, how efficient was it to find a cleaner?",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              ((index) => Icon(
                                Icons.star,
                                color: index == 4 ? Colors.grey : Colors.amber,
                              )),
                            ),
                          ],
                        ),

                        SizedBox(height: 24),

                        Align(
                          alignment: AlignmentGeometry.centerStart,
                          child: Text(
                            textAlign: TextAlign.start,
                            "Would you recommend this cleaner?",
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 40.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 0.8,
                                    color: context.appColors.successColor,
                                  ),
                                  color: context.appColors.onSuccessContainer
                                      .withValues(alpha: 0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.thumb_up_sharp),
                                      SizedBox(width: 10),
                                      Text(
                                        'Yes, definitely',
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: context
                                                  .appColors
                                                  .successColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 40.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 0.8,
                                    color: context
                                        .theme
                                        .colorScheme
                                        .outlineVariant,
                                  ),
                                  color: context.appColors.onSuccessContainer
                                      .withValues(alpha: 0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.thumb_down_sharp),
                                      SizedBox(width: 10),
                                      Text(
                                        'Not really',
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: context
                                                  .theme
                                                  .colorScheme
                                                  .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Align(
                          alignment: AlignmentGeometry.centerStart,
                          child: Text(
                            "Add a comment",
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        AppTextField(
                          controller: commentTextFieldController,
                          maxLines: 3,
                          borderColor: context.theme.colorScheme.outline,
                        ),
                        Spacer(),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AppButtonWidget(
                                labelColor: colorTheme.secondary,
                                label: 'Skip',
                                onPressed: null,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: AppButtonWidget(
                                label: 'Submit Review',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
