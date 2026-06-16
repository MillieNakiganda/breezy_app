import 'package:breezy/core/common_widgets/common_components/app_bar_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../client/bookings/presentation/components/client_booking_widget.dart';
import '../../../core/utils/router/route_names.dart';

class CleanerBookingsHistoryView extends StatefulWidget {
  const CleanerBookingsHistoryView({super.key});

  @override
  State<CleanerBookingsHistoryView> createState() =>
      _CleanerBookingsHistoryViewState();
}

class _CleanerBookingsHistoryViewState extends State<CleanerBookingsHistoryView>
    with SingleTickerProviderStateMixin {
  late final tabBarController = TabController(length: 3, vsync: this);
  final List<String> tabItems = ["Upcoming", "Cancelled", "Completed"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Bookings'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
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
                        return GestureDetector(
                          onTap: () => context.push(AppRoutes.cleanerActiveJob),
                          child: ClientBookingWidget(),
                        );
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ClientBookingWidget();
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ClientBookingWidget();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
