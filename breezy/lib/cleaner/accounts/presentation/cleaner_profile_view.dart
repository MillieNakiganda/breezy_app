import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/domain/setting.dart';

class CleanerProfileView extends StatelessWidget {
  const CleanerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const AppCachedImageWidget(
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
                              color: colorScheme.primary,
                              border: Border.all(
                                color: colorScheme.onPrimary,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                PhosphorIcons.camera,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        'Accepting jobs',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      subtitle: Text(
                        'You are visible to clients and can receive job requests',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: true,
                          onChanged: (value) {},
                          activeThumbColor: colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ...cleanerGroupedSettingsList().entries.map((entry) {
                  final groupName = entry.key;
                  final groupSettings = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        groupName.toUpperCase(),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...groupSettings.map(
                        (setting) => ListTile(
                          onTap: setting.onTap != null
                              ? () => setting.onTap!(context)
                              : null,
                          title: Text(
                            setting.title,
                            style: textTheme.bodyMedium,
                          ),
                          leading: Icon(setting.leadingIcon),
                          trailing: Icon(setting.trailingIcon),
                        ),
                      ),
                    ],
                  );
                }),
              ]),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
