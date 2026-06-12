import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBarWidget(),
      bottomNavigationBar: selectedAvailableTime == null
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 16),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
