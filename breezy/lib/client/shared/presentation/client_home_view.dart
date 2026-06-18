import 'package:breezy/client/bookings/presentation/components/cleaner_details_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/common_widgets/common_components/app_text_field.dart';

import '../../../core/utils/theme/app_sizes.dart';
import '../../../core/utils/theme/app_spacing.dart';
import '../../../core/utils/theme/theme_extensions.dart';
import 'components/client_home_card_widget.dart';

class ClientHomeView extends StatefulWidget {
  const ClientHomeView({super.key});

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.pageHorizontalPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ClipOval(
                  //   child:
                  AppCachedImageWidget(
                    width: AppSizes.avatarMd,
                    height: AppSizes.avatarMd,
                    isCircular: true,
                    imageUrl:
                        'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                  ),
                  //),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Hi,'),
                      Text(
                        'Mildred',
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.outline,
                      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      child: Icon(
                        PhosphorIcons.bell,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
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
                        color: context.theme.colorScheme.onSurfaceVariant,
                      ),
                      onChanged: (value) {
                        // Handle search input change
                      },
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.filterIconPadding),
                      child: Icon(
                        PhosphorIcons.faders,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
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
                child: ListView.builder(
                  itemCount: 4,
                  itemExtent: AppSizes.cardListItemExtent,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => showApplicationBottomSheet(context),
                      child: const CardWidget(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
