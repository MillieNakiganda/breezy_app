import 'package:breezy/cleaner/accounts/data/cleaner_registration_service.dart';
import 'package:breezy/cleaner/accounts/presentation/bio_registration_step.dart';
import 'package:breezy/core/server/server_client.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../../core/providers/user_type_provider.dart';
import '../domain/registration_step.dart';
import 'components/muti_step_header_widget.dart';
import 'documents_review_step.dart';
import 'kyc_registration_step.dart';

class CleanerRegistrationView extends StatefulWidget {
  const CleanerRegistrationView({super.key});

  @override
  State<CleanerRegistrationView> createState() =>
      _CleanerRegistrationViewState();
}

class _CleanerRegistrationViewState extends State<CleanerRegistrationView> {
  final registrationService = const CleanerRegistrationService();

  int currentStep = 0;
  bool isLoadingStatus = true;

  @override
  void initState() {
    super.initState();
    loadOnboardingStatus();
  }

  Future<void> loadOnboardingStatus() async {
    if (!ServerAuthLogic.isServerAuthenticated) {
      setState(() => isLoadingStatus = false);
      return;
    }

    try {
      final status = await registrationService.getOnboardingStatus();
      if (!mounted) return;

      setState(() {
        if (!status.hasProfile) {
          currentStep = 0;
        } else if (!status.hasCompletedVerification || !status.hasHomeAddress) {
          currentStep = 1;
        } else {
          currentStep = 2;
        }
        isLoadingStatus = false;
      });
    } catch (_) {
      if (mounted) {
        setState(() => isLoadingStatus = false);
      }
    }
  }

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
    if (index > currentStep) return;
    setState(() => currentStep = index);
  }

  Future<void> submitStepOne({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String gender,
  }) async {
    await registrationService.completeStepOne(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      gender: gender,
      userType: UserType.cleaner,
    );
    nextStep();
  }

  Future<void> submitStepTwo({
    required KYCDocumentType governmentIdDocumentType,
    required String governmentIdDocumentUrl,
    required String selfieDocumentUrl,
    required String addressLine1,
    String? addressLine2,
    required String city,
    String? state,
    required String postalCode,
    required String country,
  }) async {
    await registrationService.completeStepTwo(
      governmentIdDocumentType: governmentIdDocumentType,
      governmentIdDocumentUrl: governmentIdDocumentUrl,
      selfieDocumentUrl: selfieDocumentUrl,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
    );
    nextStep();
  }

  void showError(Object error) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error.toString())));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingStatus) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!ServerAuthLogic.isServerAuthenticated) {
      return Scaffold(
        appBar: AppBarWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: EmailSignInWidget(
              client: ServerAuthLogic.serverClient,
              startScreen: EmailFlowScreen.startRegistration,
              onAuthenticated: loadOnboardingStatus,
            ),
          ),
        ),
      );
    }

    Widget stepContent;
    switch (currentStep) {
      case 0:
        stepContent = BioRegistrationStep(
          onSubmit: submitStepOne,
          onError: showError,
        );
      case 1:
        stepContent = KycStep(onSubmit: submitStepTwo, onError: showError);
      case 2:
        stepContent = const KYCPendingView();
      default:
        stepContent = const SizedBox.shrink();
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
                alignment: Alignment.topLeft,
                child: Text(
                  multiSteps[currentStep].title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
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
