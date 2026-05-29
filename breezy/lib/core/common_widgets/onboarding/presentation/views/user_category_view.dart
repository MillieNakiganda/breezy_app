import 'package:breezy/core/common_widgets/common_components/app_bar_widget.dart';
import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/images.dart';
import 'package:breezy/core/utils/router/route_names.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/user_category_widget.dart';

class UserCategoryView extends StatefulWidget {
  const UserCategoryView({super.key});

  @override
  State<UserCategoryView> createState() => _UserCategoryViewState();
}

class _UserCategoryViewState extends State<UserCategoryView> {
  @override
  Widget build(BuildContext context) {
    var colorTheme = context.theme.colorScheme;
    var textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choose a category',
                style: textTheme.bodyLarge?.copyWith(
                  color: colorTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you an influencer or brand?',
                style: textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCard(
                    context: context,
                    image: Images.clients,
                    label: 'Client',
                    isSelected: true,
                    onTap: () {},
                  ),
                  CategoryCard(
                    context: context,
                    image: Images.cleaners,
                    label: 'Cleaner',
                    isSelected: false,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 40),
              AppButtonWidget(
                backgroundColor: colorTheme.primary,
                label: "Continue",
                onPressed: () => context.push(AppRoutes.registrationView),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
