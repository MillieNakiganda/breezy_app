import 'package:flutter/material.dart';

import '../../../../core/utils/theme/theme_extensions.dart';

class MultiStepHeaderWidget extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTap;
  const MultiStepHeaderWidget({
    super.key,
    required this.currentStep,
    required this.onStepTap,
  });

  @override
  Widget build(BuildContext context) {
    final steps = ['Bio', 'KYC', 'Documents'];
    final primaryColor = context.theme.colorScheme.primary;
    final greenColor = context.appColors.successContainer;
    final greyBorder = Colors.black.withValues(alpha: 0.4);
    final greyText = Colors.black.withValues(alpha: 0.8);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (index) {
          final isPast = index < currentStep;
          final isActive = index == currentStep;
          Color bgColor;
          Color borderColor = Colors.transparent;
          Color textColor;
          if (isPast) {
            bgColor = greenColor;
            textColor = context.appColors.onSuccessContainer;
          } else if (isActive) {
            bgColor = primaryColor;
            textColor = context.theme.colorScheme.onPrimary;
          } else {
            bgColor = Colors.transparent;
            borderColor = greyBorder;
            textColor = greyText;
          }
          return Row(
            children: [
              GestureDetector(
                onTap: isPast ? () => onStepTap(index) : null,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: borderColor, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              if (isActive) ...[
                const SizedBox(width: 8),
                Text(
                  steps[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
              if (index < steps.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 32,
                    height: 2,
                    color: isPast
                        ? greenColor
                        : (isActive ? primaryColor : greyBorder),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
