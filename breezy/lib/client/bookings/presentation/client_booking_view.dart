import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/router/route_names.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../cleaner/bookings/domain/time_slot.dart';

class ClientBookingView extends StatefulWidget {
  const ClientBookingView({super.key});

  @override
  State<ClientBookingView> createState() => _ClientBookingViewState();
}

class _ClientBookingViewState extends State<ClientBookingView> {
  DateTime? selectedDay;
  DateTime? focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final Map<DateTime, List<TimeSlot>> timeslots = {};
  AvailableStartTimes? selectedAvailableTime;

  DateTime normalizeDay(DateTime day) => DateTime(day.year, day.month, day.day);

  List<TimeSlot> getTimeSlots(DateTime time) =>
      timeslots[normalizeDay(time)] ?? [];

  List<AvailableStartTimes> getAvailableStartTimes(DateTime time) {
    final times = <AvailableStartTimes>[];
    for (final slot in getTimeSlots(time)) {
      for (final availableTime in slot.availableSlots) {
        times.add(AvailableStartTimes(slot.price, availableTime));
      }
    }
    return times;
  }

  int selectedHouse = 0;

  bool isSameTimeOfDay(TimeOfDay a, TimeOfDay b) =>
      a.hour == b.hour && a.minute == b.minute;

  @override
  void initState() {
    super.initState();
    prefillTimeSlots();
  }

  void prefillTimeSlots() {
    timeslots[normalizeDay(DateTime(2026, 6, 12))] = [
      TimeSlot(
        startTime: const TimeOfDay(hour: 8, minute: 0),
        endTime: const TimeOfDay(hour: 14, minute: 0),
        price: 75.00,
      ),
      TimeSlot(
        startTime: const TimeOfDay(hour: 14, minute: 0),
        endTime: const TimeOfDay(hour: 16, minute: 0),
        price: 85.00,
      ),
    ];
    timeslots[normalizeDay(DateTime(2026, 6, 17))] = [
      TimeSlot(
        startTime: const TimeOfDay(hour: 10, minute: 0),
        endTime: const TimeOfDay(hour: 12, minute: 0),
        price: 90.00,
      ),
      TimeSlot(
        startTime: const TimeOfDay(hour: 15, minute: 0),
        endTime: const TimeOfDay(hour: 17, minute: 0),
        price: 95.00,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'New Booking'),
      bottomNavigationBar: selectedAvailableTime == null
          ? null
          : Material(
              elevation: 5,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedAvailableTime!.time.format(context),
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${selectedAvailableTime!.price.toStringAsFixed(2)}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorTheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppButtonWidget(
                      label: 'Book',
                      buttonWidth: 140,
                      backgroundColor: colorTheme.primary,
                      labelColor: colorTheme.onPrimary,
                      onPressed: () {
                        context.push(AppRoutes.bookingConfirmationView);
                      },
                    ),
                  ],
                ),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 3, 14),
                      selectedDayPredicate: (day) {
                        return isSameDay(selectedDay, day);
                      },
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, date, events) {
                          if (timeslots.containsKey(normalizeDay(date))) {
                            return Positioned(
                              bottom: 1,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }
                          return null;
                        },
                      ),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          this.selectedDay = selectedDay;
                          this.focusedDay = focusedDay;
                          selectedAvailableTime = null;
                        });
                      },
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        this.focusedDay = focusedDay;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Time slots for ${DateFormat('EEEE, MMMM dd, yyyy').format(this.selectedDay ?? DateTime.now())}',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    selectedDay != null &&
                            getAvailableStartTimes(selectedDay!).isNotEmpty
                        ? Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...getAvailableStartTimes(selectedDay!).map(
                                (slot) => FilterChip(
                                  label: Text(slot.time.format(context)),
                                  selected:
                                      selectedAvailableTime != null &&
                                      isSameTimeOfDay(
                                        selectedAvailableTime!.time,
                                        slot.time,
                                      ),
                                  onSelected: (_) {
                                    setState(() {
                                      selectedAvailableTime = slot;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 64,
                                  color: colorTheme.outline,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'No time slots for this day',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: colorTheme.outline,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Cleaner is not available on this day',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: colorTheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ),

                    SizedBox(height: 16),
                    selectedDay != null &&
                            getAvailableStartTimes(selectedDay!).isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose a home',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'See all',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 16),
                    selectedDay != null &&
                            getAvailableStartTimes(selectedDay!).isNotEmpty
                        ? SizedBox(
                            height: 0.25 * constraints.maxHeight,
                            child: ListView.builder(
                              itemCount: 2,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: index == selectedHouse
                                            ? context.theme.colorScheme.primary
                                            : context
                                                  .theme
                                                  .colorScheme
                                                  .outlineVariant,
                                      ),
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: context
                                              .theme
                                              .colorScheme
                                              .secondaryContainer,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(PhosphorIcons.houseFill),
                                        ),
                                      ),
                                      title: Text(
                                        'Brroklyn Apartment',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                      subtitle: Text(
                                        '112 Hentry Street, Apt 48',
                                        style: context.textTheme.bodySmall,
                                      ),
                                      trailing: index == selectedHouse
                                          ? Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Icon(
                                                Icons.check_circle,
                                                color: context
                                                    .theme
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox.shrink(),
                    Row(
                      children: [
                        Icon(PhosphorIcons.plus, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Add another home',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Who should we ask',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                context.theme.colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: context.theme.colorScheme.outlineVariant,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Icon(PhosphorIcons.user),

                                Text(
                                  'Single Cleaner',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Send to Sophia only',
                                  style: context.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: context.theme.colorScheme.outline,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(PhosphorIcons.usersFour),
                                Text(
                                  'First to accept',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Send to cleaners nearby',
                                  style: context.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
