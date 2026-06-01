import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';

class CleanerProfileDetailsView extends StatelessWidget {
  const CleanerProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesOffered = [
      'Home Cleaning',
      'Office Cleaning',
      'Carpet Cleaning',
      'Window Cleaning',
      'Laundry Services',
    ];

    return Scaffold(
      appBar: AppBarWidget(),
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
                            ClipOval(
                              child: AppCachedImageWidget(
                                width: 150,
                                height: 150,
                                imageUrl:
                                    'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
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
                      SizedBox(height: 8),
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
