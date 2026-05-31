import 'package:flutter/material.dart';

class CleanerBookingsView extends StatelessWidget {
  const CleanerBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bookings',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
