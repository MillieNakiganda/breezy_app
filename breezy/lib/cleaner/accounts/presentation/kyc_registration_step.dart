import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../domain/registration_step.dart';
import 'components/dashed_border.dart';

class KycStep extends StatefulWidget {
  const KycStep({super.key, required this.onContinue});
  final VoidCallback onContinue;

  @override
  State<KycStep> createState() => _KycStepState();
}

class _KycStepState extends State<KycStep> {
  int currentStep = 0;
  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == steps().length - 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        steps: steps(),
        currentStep: currentStep,
        onStepContinue: () {
          if (isLastStep) {
            widget.onContinue();
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: isFirstStep
            ? null
            : () => setState(() {
                currentStep -= 1;
              }),

        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                AppButtonWidget(
                  buttonWidth: 20.w,
                  onPressed: details.onStepContinue,
                  label: isLastStep ? 'Finish' : 'Continue',
                ),
                if (!isFirstStep) ...[
                  const SizedBox(width: 8),
                  AppButtonWidget(
                    backgroundColor: Colors.transparent,
                    buttonWidth: 20.w,
                    onPressed: details.onStepCancel,
                    label: 'Back',
                    borderSideWidth: 0.5,
                    borderSideColor: context.theme.colorScheme.outlineVariant,
                    labelColor: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> steps() => [
    Step(
      isActive: currentStep >= 0,
      title: Text('Government ID'),
      content: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.teal,
              strokeWidth: 2,
              dashWidth: 10,
              dashSpace: 5,
              borderRadius: 12,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 70.w,
                    height: 10.h,
                    padding: const EdgeInsets.all(16),
                    child: Center(child: const Text('Upload your ID')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 1,
      title: Text('Selfie Verification'),
      content: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.teal,
              strokeWidth: 2,
              dashWidth: 10,
              dashSpace: 5,
              borderRadius: 12,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 70.w,
                    height: 10.h,
                    padding: const EdgeInsets.all(16),
                    child: Center(child: const Text('Upload your ID')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 2,
      title: Text('Home Address'),
      content: Column(),
    ),
  ];
}
