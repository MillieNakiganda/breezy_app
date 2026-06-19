import 'package:breezy/core/common_widgets/common_components/app_text_field.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/floating_bottom_sheet.dart';
import '../domain/time_slot.dart';

class CleanerBookingsView extends StatefulWidget {
  const CleanerBookingsView({super.key});

  @override
  State<CleanerBookingsView> createState() => _CleanerBookingsViewState();
}

class _CleanerBookingsViewState extends State<CleanerBookingsView> {
  DateTime? selectedDay;
  DateTime? focusedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  TextEditingController priceController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final Map<DateTime, List<TimeSlot>> timeslots = {};

  DateTime normalizeDay(DateTime day) => DateTime(day.year, day.month, day.day);

  List<TimeSlot> getTimeSlots(DateTime time) =>
      timeslots[normalizeDay(time)] ?? [];

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.theme.colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  });
                  showFloatingBottomSheet(
                    context: context,
                    isDismissible: true,
                    child: StatefulBuilder(
                      builder: ((context, setState) {
                        final formKey = GlobalKey<FormState>();
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                          child: Form(
                            key: formKey,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FloatingBottomSheetHandle(),
                                    SizedBox(height: 16),

                                    Text(
                                      "Add Time Slot",
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Start Time',
                                          style: textTheme.bodySmall,
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            final picked = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            if (picked != null) {
                                              setState(() {
                                                startTime = picked;
                                              });
                                            }
                                          },

                                          child: Text(
                                            startTime?.format(context) ??
                                                'Select',
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'End Time',
                                          style: textTheme.bodySmall,
                                        ),
                                        TextButton(
                                          style: ButtonStyle(),
                                          onPressed: () async {
                                            final picked = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            if (picked != null) {
                                              setState(() {
                                                endTime = picked;
                                              });
                                            }
                                          },
                                          child: Text(
                                            endTime?.format(context) ??
                                                'Select',
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Align(
                                      alignment: AlignmentGeometry.topStart,
                                      child: Text(
                                        'Price',
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    AppTextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d*\.?\d*$'),
                                        ),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: priceController,
                                      prefixIcon: Icon(
                                        PhosphorIcons.currencyDollar,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButtonWidget(
                                          label: 'Cancel',
                                          buttonWidth:
                                              0.45 * constraints.maxWidth,
                                          buttonHeight: 38,
                                          backgroundColor: context
                                              .theme
                                              .colorScheme
                                              .surfaceContainerHigh,
                                          labelColor: context
                                              .theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                          onPressed: () => context.pop(),
                                        ),
                                        SizedBox(width: 16),
                                        AppButtonWidget(
                                          label: 'Save',
                                          backgroundColor:
                                              context.theme.colorScheme.primary,
                                          buttonWidth:
                                              0.45 * constraints.maxWidth,
                                          buttonHeight: 38,
                                          onPressed: () {
                                            if (startTime == null ||
                                                endTime == null ||
                                                priceController.text.isEmpty) {
                                              return;
                                            }

                                            final day = normalizeDay(
                                              this.selectedDay!,
                                            );
                                            this.setState(() {
                                              timeslots
                                                  .putIfAbsent(day, () => [])
                                                  .add(
                                                    TimeSlot(
                                                      startTime: startTime!,
                                                      endTime: endTime!,
                                                      price: double.parse(
                                                        priceController.text,
                                                      ),
                                                    ),
                                                  );
                                            });

                                            startTime = null;
                                            endTime = null;
                                            priceController.clear();
                                            context.pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  );
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
              const SizedBox(height: 16),
              Text(
                'Time slots for ${DateFormat('EEEE, MMMM dd, yyyy').format(selectedDay ?? DateTime.now())}',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              selectedDay != null && getTimeSlots(selectedDay!).isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: getTimeSlots(selectedDay!).length,
                        itemBuilder: ((context, index) {
                          final slot = getTimeSlots(selectedDay!)[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tileColor:
                                  context.theme.colorScheme.secondaryContainer,
                              leading: Icon(
                                PhosphorIcons.watch,
                                color: colorTheme.secondary,
                              ),
                              title: Text(
                                '${slot.startTime.format(context)} - ${slot.endTime.format(context)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'Price: \$${slot.price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: context.appColors.warning,
                                    ),
                                    onPressed: null,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      PhosphorIcons.trash,
                                      color: colorTheme.error,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
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
                            'No time slots added yet',
                            style: TextStyle(
                              fontSize: 16,
                              color: colorTheme.outline,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tap on a day to add time slots',
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
      ),
    );
  }
}
