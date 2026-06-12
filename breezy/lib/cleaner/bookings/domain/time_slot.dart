import 'package:flutter/material.dart';

class TimeSlot {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final double price;

  TimeSlot({
    required this.startTime,
    required this.endTime,
    required this.price,
  });
}

class AvailableStartTimes {
  final TimeOfDay time;
  final double price;

  AvailableStartTimes(this.price, this.time);
}

List<TimeOfDay> getAvailableTimes(TimeOfDay start, TimeOfDay end) {
  final slots = <TimeOfDay>[];
  for (
    var time = start;
    time.hour * 60 + time.minute < end.hour * 60 + end.minute;
    time = time.addMinutes(60)
  ) {
    slots.add(time);
  }
  return slots;
}

extension TimeSlotAvailableSlots on TimeSlot {
  List<TimeOfDay> get availableSlots => getAvailableTimes(startTime, endTime);
}

extension TimeOfDayAddition on TimeOfDay {
  TimeOfDay addMinutes(int minutesToAdd) {
    final todayDate = DateTime.now();

    final baseDateTime = DateTime(todayDate.year, 1, 1, hour, minute);
    final newDateTime = baseDateTime.add(Duration(minutes: minutesToAdd));
    return TimeOfDay.fromDateTime(newDateTime);
  }
}
