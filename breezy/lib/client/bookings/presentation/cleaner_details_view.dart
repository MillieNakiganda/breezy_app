import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/utils/router/route_names.dart';
import 'components/review_card_widget.dart';
import 'components/service_chip_widget.dart';
import 'components/stats_box.dart';

class CleanerDetailsView extends StatelessWidget {
  const CleanerDetailsView({super.key});

  static const servicesOffered = [
    'Home',
    'Office ',
    'Carpet Cleaning',
    'Window Cleaning',
    'Laundry Services',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Cleaner Details'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: AppButtonWidget(
          label: 'Book Now',
          backgroundColor: context.theme.colorScheme.primary,
          labelColor: context.theme.colorScheme.onPrimary,
          onPressed: () {
            context.push(AppRoutes.clientBookingView);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 32, left: 32, top: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AppCachedImageWidget(
                            width: 150,
                            height: 150,
                            isCircular: true,
                            imageUrl:
                                'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
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
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Millie Nakiganda',
                        style: context.theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const StatsBox(),
                    const SizedBox(height: 16),
                    Text(
                      'About',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Services Offered',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: servicesOffered
                          .map((service) => ServiceChipWidget(label: service))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: ReviewCardWidget(
                      name: 'Jane Doe',
                      rating: '4.9',
                      review:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
                    ),
                  ),
                  childCount: 2,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
