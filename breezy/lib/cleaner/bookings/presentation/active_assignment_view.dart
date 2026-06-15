import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../cleaner/accounts/presentation/components/document_widget.dart';
import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/common_widgets/common_components/app_cached_image_widget.dart';
import '../../../core/utils/router/route_names.dart';

class ActiveAssignmentView extends StatefulWidget {
  const ActiveAssignmentView({super.key});

  @override
  State<ActiveAssignmentView> createState() => _ActiveAssignmentViewState();
}

class _ActiveAssignmentViewState extends State<ActiveAssignmentView> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Active job'),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 16,
          bottom: 16,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorTheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            leading: ClipOval(
                              child: AppCachedImageWidget(
                                height: 50,
                                width: 50,
                                imageUrl: '',
                              ),
                            ),
                            title: Text(
                              'Sofia Vargas',
                              style: context.textTheme.bodyMedium,
                            ),
                            subtitle: Text(
                              '112 Henry St, Apt 4B',
                              style: context.textTheme.bodySmall,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context
                                        .theme
                                        .colorScheme
                                        .surfaceContainerLow,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(PhosphorIcons.phone),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context
                                        .theme
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      PhosphorIcons.chatCircleThin,
                                      color: context
                                          .theme
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      Center(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerLow,
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: context
                                  .theme
                                  .colorScheme
                                  .surfaceContainerHigh,
                            ),
                          ),
                          child: Stack(
                            alignment: AlignmentGeometry.center,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 300,
                                child: CircularProgressIndicator(
                                  backgroundColor: colorTheme.secondary,
                                  value: 0.8,
                                  // valueColor: Animation<Color>(colorTheme.tertiary) ,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "1:24:08",
                                    style: context.textTheme.displayMedium,
                                  ),
                                  Text(
                                    "Started 10:30 AM. Est, 2h",
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Spacer(),
                      Align(
                        alignment: AlignmentGeometry.bottomCenter,
                        child: AppButtonWidget(
                          label: 'Mark Cleaning Complete',
                          labelColor: colorTheme.onSecondaryContainer,
                          onPressed: null,
                        ),
                      ),

                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
