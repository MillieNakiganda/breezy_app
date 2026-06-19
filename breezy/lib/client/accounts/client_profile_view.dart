import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../core/domain/setting.dart';

class ClientProfileView extends StatelessWidget {
  const ClientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
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
                            color: Colors.white,
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
              ),
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                ...clientGroupedSettingsList().entries.map((entry) {
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
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
