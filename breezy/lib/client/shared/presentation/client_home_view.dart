import 'package:breezy/client/bookings/presentation/components/cleaner_details_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/utils/router/route_names.dart';
import '../../../core/utils/theme/theme_extensions.dart';

class ClientHomeView extends StatefulWidget {
  const ClientHomeView({super.key});

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56, left: 32, right: 32),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
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
                      shadowColor: WidgetStateProperty.all(Colors.transparent),
                      controller: searchController,
                      hintText: 'Search for services',
                      backgroundColor: WidgetStateProperty.all(
                        context.theme.colorScheme.surfaceContainerLow,
                      ),
                      onChanged: (value) {
                        // Handle search input change
                      },
                      onTap: () {
                        // Handle search bar tap
                      },
                      leading: Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Icon(
                          PhosphorIcons.magnifyingGlass,
                          color: context.theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      // onTapOutside: () {
                      //   // Handle tap outside of search bar
                      // },
                    ),

                    /* AppTextField(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      controller: searchController,
                      hintText: 'Search for services',
                      prefixIcon: Icon(PhosphorIcons.magnifyingGlass),
                      onChanged: (value) {
                        // Handle search input change
                      },
                    ),*/
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
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near you',
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: context.theme.textTheme.bodyMedium?.copyWith(),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () => showApplicationBottomSheet(context),

                      child: Hero(
                        tag: 'cleanerDetails',
                        placeholderBuilder: (context, heroSize, child) {
                          return Container(
                            width: heroSize.width,
                            height: heroSize.height,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                        child: CardWidget(),
                      ),
                    ),
                    CardWidget(),
                    CardWidget(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.theme.colorScheme.surface,
      // margin: const EdgeInsets.only(top: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: context.theme.colorScheme.outlineVariant,
          width: 0.8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AppCachedImageWidget(
                height: 100,
                width: 80,
                imageUrl:
                    'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
              ),
            ),

            SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sofia Vargas',
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <WidgetSpan>[
                            WidgetSpan(child: Icon(Icons.star, size: 14)),
                            WidgetSpan(
                              child: Text(
                                '4.9 (200)',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Deep Clean . 2km away',
                    style: context.theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$32/hr',
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.appColors.successColor,
                        ),
                      ),

                      AppButtonWidget(
                        buttonWidth: 5.w,
                        buttonHeight: 32,
                        label: 'Book',
                        backgroundColor: context.theme.colorScheme.secondary,
                        labelColor: context.theme.colorScheme.onSecondary,
                        onPressed: () =>
                            context.push(AppRoutes.cleanerDetailsView),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
