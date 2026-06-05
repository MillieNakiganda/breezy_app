import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';

class CleanerHomeView extends StatefulWidget {
  const CleanerHomeView({super.key});

  @override
  State<CleanerHomeView> createState() => _CleanerHomeViewState();
}

class _CleanerHomeViewState extends State<CleanerHomeView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, left: 32, right: 32),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: AppCachedImageWidget(
                        width: 50,
                        height: 50,
                        imageUrl:
                            'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi,'),
                        Text(
                          'Mildred',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 16),

                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.outline,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          PhosphorIcons.bell,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0.82 * constraints.maxWidth,
                      child: SearchBar(
                        shadowColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        controller: searchController,
                        hintText: 'Search for services',
                        backgroundColor: WidgetStateProperty.all(
                          context.theme.colorScheme.surfaceContainerLow,
                        ),
                        onChanged: (value) {},
                        onTap: () {},
                        leading: Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Icon(
                            PhosphorIcons.magnifyingGlass,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.w),

                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          PhosphorIcons.faders,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  tileColor: context.theme.colorScheme.secondary,
                  title: Text(
                    "You're available today",
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onSecondary,
                    ),
                  ),
                  subtitle: Text(
                    "8:00AM . 6:00PM",
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onInverseSurface,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: true,
                      onChanged: null,
                      activeTrackColor: context.theme.colorScheme.primary,
                      activeThumbColor: context.theme.colorScheme.primary,
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(
                      //   color: context.theme.colorScheme.outlineVariant,
                      //   width: 0.8,
                      // ),
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
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context
                                          .theme
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                              ),
                              Text(
                                'Today',
                                style: context.theme.textTheme.bodySmall
                                    ?.copyWith(
                                      color: context.theme.colorScheme.outline,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            color: context.theme.colorScheme.outlineVariant,
                          ),
                          Column(
                            spacing: 4,
                            children: [
                              Icon(PhosphorIcons.calendarBlank),
                              Text(
                                '126',
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context
                                          .theme
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                              ),
                              Text(
                                'Jobs Done',
                                style: context.theme.textTheme.bodySmall
                                    ?.copyWith(
                                      color: context.theme.colorScheme.outline,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            color: context.theme.colorScheme.outlineVariant,
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
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context
                                          .theme
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                              ),
                              Text(
                                'Avg Rating',
                                style: context.theme.textTheme.bodySmall
                                    ?.copyWith(
                                      color: context.theme.colorScheme.outline,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Requests',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
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
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.appColors.onSuccessContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.theme.colorScheme.outlineVariant,
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
                                ClipOval(
                                  child: AppCachedImageWidget(
                                    height: 40,
                                    width: 40,
                                    imageUrl: '',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Maya Reindhardt',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Deep Clean . 2 hours',
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                            color: context
                                                .theme
                                                .colorScheme
                                                .outline,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <WidgetSpan>[
                                  WidgetSpan(
                                    child: Text(
                                      '\$96',
                                      style: context.textTheme.bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                context.appColors.successColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            children: <WidgetSpan>[
                              WidgetSpan(
                                child: Icon(
                                  PhosphorIcons.clock,
                                  size: 14,
                                  color: context.theme.colorScheme.outline,
                                ),
                              ),
                              WidgetSpan(
                                child: Text(
                                  ' Tue 10:00 AM  ',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.theme.colorScheme.outline,
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  PhosphorIcons.mapPin,
                                  size: 14,
                                  color: context.theme.colorScheme.outline,
                                ),
                              ),
                              WidgetSpan(
                                child: Text(
                                  ' 0.8 miles away',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.theme.colorScheme.outline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtonWidget(
                              label: 'Decline',
                              buttonWidth: 0.45 * constraints.maxWidth,
                              buttonHeight: 38,
                              backgroundColor: context
                                  .theme
                                  .colorScheme
                                  .surfaceContainerHigh,
                              labelColor:
                                  context.theme.colorScheme.onSurfaceVariant,
                              onPressed: () {},
                            ),
                            SizedBox(width: 16),
                            AppButtonWidget(
                              label: 'Accept job',
                              backgroundColor:
                                  context.theme.colorScheme.primary,
                              buttonWidth: 0.45 * constraints.maxWidth,
                              buttonHeight: 38,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Today',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.appColors.successColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Card(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  elevation: 0,
                  child: ListTile(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12.0),
                    //   side: BorderSide(
                    //     color: context.theme.colorScheme.outlineVariant,
                    //     width: 0.8,
                    //   ),
                    // ),
                    leading: Container(
                      width: 65,
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.appColors.successColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "11: 00PM",
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.appColors.successColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    title: Text(
                      'Elena Whitmore',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                    subtitle: Text(
                      'Standard Clean . \$72',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                    ),
                    trailing: Icon(PhosphorIcons.caretRight),
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  elevation: 0,
                  child: ListTile(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12.0),
                    //   side: BorderSide(
                    //     color: context.theme.colorScheme.outlineVariant,
                    //     width: 0.8,
                    //   ),
                    // ),
                    leading: Container(
                      width: 65,
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.appColors.successColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "11: 00PM",
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.appColors.successColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    title: Text(
                      'Elena Whitmore',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                    subtitle: Text(
                      'Standard Clean . \$72',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                    ),
                    trailing: Icon(PhosphorIcons.caretRight),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
