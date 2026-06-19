import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'components/client_booking_widget.dart';

class BookingsView extends StatefulWidget {
  const BookingsView({super.key});

  @override
  State<BookingsView> createState() => _BookingsViewState();
}

class _BookingsViewState extends State<BookingsView>
    with SingleTickerProviderStateMixin {
  late final tabBarController = TabController(length: 3, vsync: this);
  final List<String> tabItems = ["Upcoming", "Cancelled", "Completed"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            'Bookings History',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
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
                        style: textTheme.bodySmall?.copyWith(
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
                    return ClientBookingWidget();
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
    );
  }
}
