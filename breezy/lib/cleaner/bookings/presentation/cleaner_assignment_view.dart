import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../cleaner/accounts/presentation/components/document_widget.dart';
import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/utils/router/route_names.dart';

class CleanerAssignmentView extends StatefulWidget {
  const CleanerAssignmentView({super.key});

  @override
  State<CleanerAssignmentView> createState() => _CleanerAssignmentViewState();
}

class _CleanerAssignmentViewState extends State<CleanerAssignmentView> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Cleaning Request'),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 16,
          bottom: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.appColors.warningContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text(
                        'Respond within 14:32 . Sent to 3 cleaners',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.appColors.onWarningContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: colorTheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    leading: ClipOval(
                      child: AppCachedImageWidget(
                        height: 50,
                        width: 50,
                        imageUrl: '',
                      ),
                    ),
                    title: Text(
                      'Sofia Vargas',
                      style: context.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'Deep cleaning',
                      style: context.textTheme.bodySmall,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                context.theme.colorScheme.surfaceContainerLow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(PhosphorIcons.phone),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.theme.colorScheme.primaryContainer,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              PhosphorIcons.chatCircleThin,
                              color:
                                  context.theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: context.theme.colorScheme.surfaceContainerHigh,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'DATE',
                      description: 'Tuesday, Oct 15',
                      icon: PhosphorIcons.calendarBlank,
                    ),
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'TIME',
                      description: '10:00 AM . 2 hours',
                      icon: PhosphorIcons.watch,
                    ),
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'PROPERTY',
                      description: '2 bed apt. 820 ft',
                      icon: PhosphorIcons.mapPin,
                    ),
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'ADDRESS',
                      description: '112 Henry St, Brooklyn',
                      icon: PhosphorIcons.mapPin,
                    ),
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'SERVICE',
                      description: 'Deep Clean',
                      icon: PhosphorIcons.broom,
                    ),
                    DocumentWidget(
                      addTrailingWidget: false,
                      title: 'ESTIMATED PAY',
                      description: '\$80.00',
                      icon: PhosphorIcons.money,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'CLIENT NOTES',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: colorTheme.surfaceContainerHigh),
                  color: colorTheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '"Two cats, please use pet-safe products if possible. Focus on kitchen and bathrooms. Keys with doorman."',
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtonWidget(
                    buttonWidth: 35.w,
                    label: 'Reject',
                    labelColor: colorTheme.onSecondaryContainer,
                    onPressed: null,
                  ),
                  AppButtonWidget(
                    buttonWidth: 35.w,
                    label: 'Accept',
                    onPressed: () {
                      context.push(AppRoutes.cleaningLifeCycle);
                    },
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
