import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../cleaner/accounts/presentation/components/document_widget.dart';
import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/utils/router/route_names.dart';

class BookingConfirmationView extends StatefulWidget {
  const BookingConfirmationView({super.key});

  @override
  State<BookingConfirmationView> createState() =>
      _BookingConfirmationViewState();
}

class _BookingConfirmationViewState extends State<BookingConfirmationView> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Booking Confirmation'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.appColors.warningContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.appColors.warning,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              PhosphorIcons.check,
                              size: 32,
                              color: context.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Request sent!',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.center,
                      "We've notified 3 nearby cleaners. You'll be alerted as soon as asomeone accepts",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.outline,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                        children: const [
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
                            title: 'ADDRESS',
                            description: '112 Henry St, Apt 4B',
                            icon: PhosphorIcons.mapPin,
                          ),
                          DocumentWidget(
                            addTrailingWidget: false,
                            title: 'SERVICE',
                            description: 'Deep Clean',
                            icon: PhosphorIcons.broom,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: context.appColors.warning.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.appColors.warning,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Awaiting cleaner response'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: AppButtonWidget(
                            label: 'Cancel Booking',
                            labelColor: colorTheme.onSecondaryContainer,
                            onPressed: null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: AppButtonWidget(
                            label: 'Track Booking',
                            onPressed: () {
                              context.push(AppRoutes.cleaningLifeCycle);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
