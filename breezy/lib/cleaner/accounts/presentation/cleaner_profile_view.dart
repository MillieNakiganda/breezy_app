import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/domain/setting.dart';

class CleanerProfileView extends StatelessWidget {
  const CleanerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 56),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Spacer(),
                    Stack(
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
                              color: context.theme.colorScheme.primary,
                              border: Border.all(
                                color: context.theme.colorScheme.onPrimary,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                PhosphorIcons.camera,
                                color: context.theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          'Accepting jobs',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color:
                                context.theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                        subtitle: Text(
                          'You are visible to clients and can receive job requests',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeThumbColor:
                                context.theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 32),
                    ...cleanerGroupedSettingsList().entries.map((entry) {
                      final groupName = entry.key;
                      final groupSettings = entry.value;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            groupName.toUpperCase(),
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.colorScheme.outline,
                            ),
                          ),
                          SizedBox(height: 8),
                          ...groupSettings.map(
                            (setting) => ListTile(
                              onTap: setting.onTap != null
                                  ? () => setting.onTap!(context)
                                  : null,
                              title: Text(
                                setting.title,
                                style: context.textTheme.bodyMedium,
                              ),
                              leading: Icon(setting.leadingIcon),
                              trailing: Icon(setting.trailingIcon),
                            ),
                          ),
                        ],
                      );
                    }),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
