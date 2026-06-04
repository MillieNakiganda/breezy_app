import 'package:breezy/core/common_widgets/common_components/app_text_field.dart';
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
            children: [
              SizedBox(
                width: 72.w,
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
                margin: const EdgeInsets.only(left: 10),

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
        ],
      ),
    );
  }
}
