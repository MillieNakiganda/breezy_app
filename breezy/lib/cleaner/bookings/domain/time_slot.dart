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
