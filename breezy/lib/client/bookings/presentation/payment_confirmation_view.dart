import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/utils/router/route_names.dart';

class PaymentConfirmationView extends StatefulWidget {
  const PaymentConfirmationView({super.key});

  @override
  State<PaymentConfirmationView> createState() =>
      _PaymentConfirmationViewState();
}

class _PaymentConfirmationViewState extends State<PaymentConfirmationView> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBarWidget(title: 'Payment'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 16,
            bottom: 40,
          ),
          child: Column(
            children: [
              Text(
                'TOTAL DUE',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.outline,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '\$90',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                "2hr. Deep Clean. Sofia Vargas",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.outline,
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                    color: context.theme.colorScheme.surfaceContainerHigh,
                  ),
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service (2hr x \$40)',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colorTheme.outline,
                          ),
                        ),
                        Text(
                          '\$80',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Fee',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colorTheme.outline,
                          ),
                        ),
                        Text(
                          '\$10',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colorTheme.outline,
                          ),
                        ),
                        Text(
                          '\$8',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$96',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              AppButtonWidget(
                label: 'Pay \$80',
                onPressed: () {
                  context.push(AppRoutes.cleanerRatingView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
