import 'package:flutter/material.dart';

import '../../core/utils/theme/theme_extensions.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History',
        style: context.textTheme.bodySmall?.copyWith(
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}
