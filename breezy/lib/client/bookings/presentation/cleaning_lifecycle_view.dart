import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/common_widgets/common_components/app_cached_image_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/utils/router/route_names.dart';
import '../domain/cleaning_lifecycle.dart';

class CleaningLifeCycleView extends StatefulWidget {
  const CleaningLifeCycleView({super.key});

  @override
  State<CleaningLifeCycleView> createState() => _CleaningLifeCycleViewState();
}

class _CleaningLifeCycleViewState extends State<CleaningLifeCycleView> {
  IconData getIcon(String status) {
    switch (status) {
      case 'completed':
        return PhosphorIcons.check;
      case 'pending':
        return Icons.adjust;
      case 'next':
        return Icons.radio_button_checked;
      default:
        return PhosphorIcons.airplane;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Cleaning life Cycle'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 16,
            //bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: lifeCycleEvents.length,
                  itemBuilder: (context, index) {
                    final item = lifeCycleEvents[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (lifeCycleEvents.length - 1) == index
                                    ? context
                                          .theme
                                          .colorScheme
                                          .surfaceContainerHigh
                                    : context.theme.colorScheme.primary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  getIcon(item.status),
                                  color: context.theme.colorScheme.onSecondary,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item.event,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: (lifeCycleEvents.length - 1) == index
                                      ? context.theme.colorScheme.outlineVariant
                                      : context.theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            //Spacer(),
                            Text(
                              '10:50 AM',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: colorTheme.outline,
                              ),
                            ),
                          ],
                        ),
                        (lifeCycleEvents.length - 1) == index
                            ? SizedBox.shrink()
                            : Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 30,
                                width: 2,
                                decoration: BoxDecoration(
                                  color:
                                      ((lifeCycleEvents.length - 1) - 1) ==
                                          index
                                      ? context
                                            .theme
                                            .colorScheme
                                            .surfaceContainerHigh
                                      : context.theme.colorScheme.primary,
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ),
              AppButtonWidget(
                label: 'Awaiting cleaner response',
                onPressed: () => context.push(AppRoutes.paymentConfirmation),
                labelColor: colorTheme.secondary,
              ),
              SizedBox(height: 16),
              Text(
                "You'll be prompted to pay once Sofia marks the job as done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
