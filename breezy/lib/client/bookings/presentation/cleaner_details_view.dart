import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/common_widgets/common_components/app_button_widget.dart';

class CleanerDetailsView extends StatelessWidget {
  const CleanerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesOffered = [
      'Home',
      'Office ',
      'Carpet Cleaning',
      'Window Cleaning',
      'Laundry Services',
    ];

    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: AppButtonWidget(
          label: 'Book Now',
          backgroundColor: context.theme.colorScheme.primary,
          labelColor: context.theme.colorScheme.onPrimary,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 16),
        child: LayoutBuilder(
          builder: ((context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      //Spacer(),
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,

                          children: [
                            Hero(
                              tag: 'cleanerDetails',
                              child: ClipOval(
                                child: AppCachedImageWidget(
                                  width: 150,
                                  height: 150,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.theme.colorScheme.onPrimary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Millie Nakiganda',
                          style: context.theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
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
                            // color: context.theme.colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: context.theme.colorScheme.outlineVariant,
                              width: 0.8,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '4.9',
                                      style: context.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Rating',
                                      style: context.theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  color:
                                      context.theme.colorScheme.outlineVariant,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '126',
                                      style: context.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Jobs',
                                      style: context.theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  color:
                                      context.theme.colorScheme.outlineVariant,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '3yrs',
                                      style: context.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'on Breezy',
                                      style: context.theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'About',
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Services Offered',
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: servicesOffered
                            .map(
                              (service) => Chip(
                                label: Text(service),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See all',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: context.theme.primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: context.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: context.theme.colorScheme.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '4.9',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      children: const <WidgetSpan>[
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: context.theme.colorScheme.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jane Doe',
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '4.9',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      children: const <WidgetSpan>[
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
