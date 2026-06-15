import 'package:breezy/core/common_widgets/common_components/app_bar_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/router/route_names.dart';

class CleanerNotificationView extends StatefulWidget {
  const CleanerNotificationView({super.key});

  @override
  State<CleanerNotificationView> createState() =>
      _CleanerNotificationViewState();
}

class _CleanerNotificationViewState extends State<CleanerNotificationView>
    with SingleTickerProviderStateMixin {
  late final tabBarController = TabController(length: 3, vsync: this);
  final List<String> tabItems = ["All", "Jobs", "Payouts"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 56),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              onTap: (value) => setState(() {
                selectedIndex = value;
              }),
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              controller: tabBarController,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                ...List.generate(tabItems.length, (index) {
                  final currentTab = tabItems[index];
                  return Tab(
                    height: 40,

                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(16),
                        color: index == selectedIndex
                            ? colorTheme.secondaryContainer
                            : colorTheme.surfaceContainerHigh,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12,
                        ),
                        child: Text(
                          currentTab,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: index == selectedIndex
                                ? colorTheme.onSecondaryContainer
                                : colorTheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: tabBarController,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () =>
                            context.push(AppRoutes.cleanerAssignmentView),
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorTheme.secondaryContainer,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.check),
                          ),
                        ),
                        title: Text(
                          "New cleaning request",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "Maya R.A . 3 bed. deep clean",
                          style: context.textTheme.bodySmall,
                        ),
                        trailing: Text(
                          "Yesterday",
                          style: context.textTheme.bodySmall,
                        ),
                      );
                    },
                  ),
                  Center(child: Text('No data available')),
                  Center(child: Text('No data available')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
