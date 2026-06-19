import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/app_sizes.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/common_widgets/common_components/app_text_field.dart';
import '../../../core/utils/router/route_names.dart';
import '../../../core/utils/theme/app_spacing.dart';

class CleanerHomeView extends StatefulWidget {
  const CleanerHomeView({super.key});

  @override
  State<CleanerHomeView> createState() => _CleanerHomeViewState();
}

class _CleanerHomeViewState extends State<CleanerHomeView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AppCachedImageWidget(
                        width: 50,
                        height: 50,
                        isCircular: true,
                        imageUrl:
                            'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                      ),

                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi,'),
                          Text(
                            'Mildred',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () =>
                            context.push(AppRoutes.cleanerNotifications),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),

                          decoration: BoxDecoration(
                            color: colorTheme.outline,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              PhosphorIcons.bell,
                              color: colorTheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: AppSizes.searchFieldFlex,
                        child: AppTextField(
                          borderColor: Colors.transparent,
                          borderRadius: AppSizes.radiusXl,
                          controller: searchController,
                          hintText: 'Search for services',
                          prefixIcon: Icon(
                            PhosphorIcons.magnifyingGlass,
                            color: colorTheme.onSurfaceVariant,
                          ),
                          onChanged: (value) {
                            // Handle search input change
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Container(
                        decoration: BoxDecoration(
                          color: colorTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            PhosphorIcons.faders,
                            color: colorTheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    tileColor: colorTheme.secondary,
                    title: Text(
                      "You're available today",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorTheme.onSecondary,
                      ),
                    ),
                    subtitle: Text(
                      "8:00AM . 6:00PM",
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorTheme.onInverseSurface,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: true,
                        onChanged: null,
                        activeTrackColor: colorTheme.primary,
                        activeThumbColor: colorTheme.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorTheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 4,
                              children: [
                                Icon(
                                  PhosphorIcons.currencyDollar,
                                  color: context.appColors.successColor,
                                ),

                                Text(
                                  '284',
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorTheme.onSecondaryContainer,
                                  ),
                                ),
                                Text(
                                  'Today',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorTheme.outline,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              color: colorTheme.outlineVariant,
                            ),
                            Column(
                              spacing: 4,
                              children: [
                                Icon(PhosphorIcons.calendarBlank),
                                Text(
                                  '126',
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorTheme.onSecondaryContainer,
                                  ),
                                ),
                                Text(
                                  'Jobs Done',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorTheme.outline,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              color: colorTheme.outlineVariant,
                            ),
                            Column(
                              spacing: 4,
                              children: [
                                Icon(
                                  PhosphorIcons.star,
                                  color: context.appColors.warning,
                                ),
                                Text(
                                  '4.9',
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorTheme.onSecondaryContainer,
                                  ),
                                ),
                                Text(
                                  'Avg Rating',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorTheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Requests',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: context.appColors.successContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '2 NEW',
                            style: textTheme.bodySmall?.copyWith(
                              color: context.appColors.onSuccessContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorTheme.outlineVariant,
                        width: 0.8,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const AppCachedImageWidget(
                                    height: 40,
                                    width: 40,
                                    isCircular: true,
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                                  ),

                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Maya Reindhardt',
                                        style: textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Deep Clean . 2 hours',
                                        style: textTheme.bodySmall?.copyWith(
                                          color: colorTheme.outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '',
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <WidgetSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        '\$96',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: context.appColors.successColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              children: <WidgetSpan>[
                                WidgetSpan(
                                  child: Icon(
                                    PhosphorIcons.clock,
                                    size: 14,
                                    color: colorTheme.outline,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text(
                                    ' Tue 10:00 AM  ',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorTheme.outline,
                                    ),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    PhosphorIcons.mapPin,
                                    size: 14,
                                    color: colorTheme.outline,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text(
                                    ' 0.8 miles away',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorTheme.outline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: AppButtonWidget(
                                  label: 'Decline',

                                  buttonHeight: 38,
                                  backgroundColor:
                                      colorTheme.surfaceContainerHigh,
                                  labelColor: colorTheme.onSurfaceVariant,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: AppButtonWidget(
                                  label: 'Accept job',
                                  backgroundColor: colorTheme.primary,

                                  buttonHeight: 38,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Today',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.cleanerBookingHistory),
                    child: Text(
                      'See all',
                      style: textTheme.bodySmall?.copyWith(
                        color: context.appColors.successColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  color: colorTheme.surfaceContainerLow,
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      width: 65,
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.appColors.successColor.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "11: 00PM",
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.appColors.successColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Elena Whitmore',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorTheme.secondary,
                      ),
                    ),
                    subtitle: Text(
                      'Standard Clean . \$72',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorTheme.outlineVariant,
                      ),
                    ),
                    trailing: Icon(PhosphorIcons.caretRight),
                  ),
                ),
                childCount: 2,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
          ],
        ),
      ),
    );
  }
}
