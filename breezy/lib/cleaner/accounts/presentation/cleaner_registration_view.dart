import 'package:breezy/cleaner/accounts/presentation/bio_registration_step.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../domain/registration_step.dart';
import 'components/muti-step_header_widget.dart';
import 'documents_review_step.dart';
import 'kyc_registration_step.dart';

class CleanerRegistrationView extends StatefulWidget {
  const CleanerRegistrationView({super.key});

  @override
  State<CleanerRegistrationView> createState() =>
      _CleanerRegistrationViewState();
}

class _CleanerRegistrationViewState extends State<CleanerRegistrationView> {
  int currentStep = 0;

  void nextStep() {
    setState(() {
      if (currentStep < 2) currentStep++;
    });
  }

  void prevStep() {
    setState(() {
      if (currentStep > 0) currentStep--;
    });
  }

  void onStepTap(int index) {
    setState(() {
      currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget stepContent;
    switch (currentStep) {
      case 0:
        stepContent = BioRegistrationStep(onContinue: nextStep);
        break;
      case 1:
        stepContent = KycStep(onContinue: nextStep);
        break;
      case 2:
        stepContent = KYCPendingView();
      default:
        stepContent = Container();
    }
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  multiSteps[currentStep].title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  textAlign: TextAlign.justify,
                  multiSteps[currentStep].description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              MultiStepHeaderWidget(
                currentStep: currentStep,
                onStepTap: onStepTap,
              ),
              Expanded(child: stepContent),
            ],
          ),
        ),
      ),
    );
  }
}
