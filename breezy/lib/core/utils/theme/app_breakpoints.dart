import 'package:flutter/material.dart';

import 'app_spacing.dart';

enum AppBreakpoint { compact, medium, expanded }

AppBreakpoint breakpointOf(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= 600) return AppBreakpoint.expanded;
  if (width < 360) return AppBreakpoint.compact;
  return AppBreakpoint.medium;
}

double pageHorizontalPaddingFor(AppBreakpoint breakpoint) {
  return switch (breakpoint) {
    AppBreakpoint.compact => AppSpacing.md,
    AppBreakpoint.medium => AppSpacing.lg,
    AppBreakpoint.expanded => AppSpacing.lg * 2,
  };
}
