import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../core/common_widgets/common_components/app_button_widget.dart';
import 'components/document_widget.dart';

class KYCPendingView extends StatefulWidget {
  const KYCPendingView({super.key});

  @override
  State<KYCPendingView> createState() => _KYCPendingViewState();
}

class _KYCPendingViewState extends State<KYCPendingView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.appColors.warningContainer,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: Container(
                decoration: BoxDecoration(
                  color: context.appColors.warning,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    PhosphorIcons.clock,
                    size: 32,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Documents Submitted',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            "Our admin team is reviewing your application. We'll notify you within 24-48 hours.",
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.colorScheme.outline,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: context.theme.colorScheme.outlineVariant,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'SUBMITTED',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.colorScheme.outline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DocumentWidget(
                  title: 'Government ID',
                  description: 'Driver licence',
                  icon: PhosphorIcons.creditCard,
                ),
                DocumentWidget(
                  title: 'Selfie Photo',
                  description: 'Identity match passed',
                  icon: PhosphorIcons.camera,
                ),
                DocumentWidget(
                  title: 'Proof of address',
                  description: 'Utility bill',
                  icon: PhosphorIcons.fileText,
                ),

                SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.appColors.warningContainer,
              /*context.theme.colorScheme.errorContainer.withValues(
                alpha: 0.5,
              ),*/
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    color: context.appColors.onWarningContainer,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "You'll only appear in client searches once an admin approves your account",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.appColors.onWarningContainer,
                        //color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          AppButtonWidget(
            label: 'Contact Support',
            onPressed: () {},
            backgroundColor: Colors.transparent,
            borderSideWidth: 0.5,
            borderSideColor: context.theme.colorScheme.outlineVariant,
            labelColor: context.theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
