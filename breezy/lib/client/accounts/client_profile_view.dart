import 'package:breezy/client/accounts/domain/setting.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/common_widgets/common_components/app_cached_image_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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

                    SizedBox(height: 32),
                    ...groupedSettingsList().entries.map((entry) {
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
                          ...groupSettings.map(
                            (setting) => ListTile(
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
