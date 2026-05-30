import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });
  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.inversePrimary.withValues(
            alpha: 0.4,
          ),
          shape: BoxShape.circle,
        ),
        child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(icon)),
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        description,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.theme.colorScheme.outline,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colorScheme.primaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            Icons.check,
            size: 14,
            color: context.theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
