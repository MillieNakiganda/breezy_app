import 'package:breezy/core/common_widgets/common_components/app_button_widget.dart';
import 'package:breezy/core/common_widgets/common_components/app_text_field.dart';
import 'package:breezy/core/server/server_client.dart';
import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'components/dashed_border.dart';

class KycStep extends StatefulWidget {
  const KycStep({
    super.key,
    required this.onSubmit,
    required this.onError,
  });

  final Future<void> Function({
    required KYCDocumentType governmentIdDocumentType,
    required String governmentIdDocumentUrl,
    required String selfieDocumentUrl,
    required String addressLine1,
    String? addressLine2,
    required String city,
    String? state,
    required String postalCode,
    required String country,
  }) onSubmit;
  final void Function(Object error) onError;

  @override
  State<KycStep> createState() => _KycStepState();
}

class _KycStepState extends State<KycStep> {
  int currentStep = 0;
  bool _isSubmitting = false;

  KYCDocumentType _selectedIdType = KYCDocumentType.driverLicense;
  final _governmentIdUrlController = TextEditingController();
  final _selfieUrlController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController(text: 'UG');

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == steps().length - 1;

  @override
  void dispose() {
    _governmentIdUrlController.dispose();
    _selfieUrlController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  bool _validateCurrentStep() {
    switch (currentStep) {
      case 0:
        if (_governmentIdUrlController.text.trim().isEmpty) {
          widget.onError(StateError('Upload or provide your government ID URL'));
          return false;
        }
        return true;
      case 1:
        if (_selfieUrlController.text.trim().isEmpty) {
          widget.onError(StateError('Upload or provide your selfie URL'));
          return false;
        }
        return true;
      case 2:
        if (_addressLine1Controller.text.trim().isEmpty ||
            _cityController.text.trim().isEmpty ||
            _postalCodeController.text.trim().isEmpty ||
            _countryController.text.trim().isEmpty) {
          widget.onError(StateError('Complete your home address'));
          return false;
        }
        return true;
      default:
        return true;
    }
  }

  Future<void> _handleContinue() async {
    if (!_validateCurrentStep()) return;

    if (!isLastStep) {
      setState(() => currentStep += 1);
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      await widget.onSubmit(
        governmentIdDocumentType: _selectedIdType,
        governmentIdDocumentUrl: _governmentIdUrlController.text.trim(),
        selfieDocumentUrl: _selfieUrlController.text.trim(),
        addressLine1: _addressLine1Controller.text.trim(),
        addressLine2: _addressLine2Controller.text.trim().isEmpty
            ? null
            : _addressLine2Controller.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim().isEmpty
            ? null
            : _stateController.text.trim(),
        postalCode: _postalCodeController.text.trim(),
        country: _countryController.text.trim(),
      );
    } catch (error) {
      widget.onError(error);
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        steps: steps(),
        currentStep: currentStep,
        onStepContinue: _isSubmitting ? null : _handleContinue,
        onStepCancel: isFirstStep || _isSubmitting
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
                  label: _isSubmitting
                      ? 'Submitting...'
                      : isLastStep
                      ? 'Finish'
                      : 'Continue',
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
      title: const Text('Government ID'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<KYCDocumentType>(
            initialValue: _selectedIdType,
            decoration: InputDecoration(
              labelText: 'ID type',
              filled: true,
              fillColor: context.theme.colorScheme.surfaceContainerLow,
            ),
            items: const [
              DropdownMenuItem(
                value: KYCDocumentType.driverLicense,
                child: Text('Driver licence'),
              ),
              DropdownMenuItem(
                value: KYCDocumentType.nationalId,
                child: Text('National ID'),
              ),
              DropdownMenuItem(
                value: KYCDocumentType.passport,
                child: Text('Passport'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedIdType = value);
              }
            },
          ),
          const SizedBox(height: 16),
          CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.teal,
              strokeWidth: 2,
              dashWidth: 10,
              dashSpace: 5,
              borderRadius: 12,
            ),
            child: SizedBox(
              width: 70.w,
              height: 10.h,
              child: const Center(child: Text('Upload your ID')),
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _governmentIdUrlController,
            hintText: 'Document URL',
          ),
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 1,
      title: const Text('Selfie Verification'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.teal,
              strokeWidth: 2,
              dashWidth: 10,
              dashSpace: 5,
              borderRadius: 12,
            ),
            child: SizedBox(
              width: 70.w,
              height: 10.h,
              child: const Center(child: Text('Upload your selfie')),
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _selfieUrlController,
            hintText: 'Selfie URL',
          ),
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 2,
      title: const Text('Home Address'),
      content: Column(
        children: [
          AppTextField(
            controller: _addressLine1Controller,
            hintText: 'Address line 1',
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _addressLine2Controller,
            hintText: 'Address line 2 (optional)',
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _cityController,
            hintText: 'City',
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _stateController,
            hintText: 'State / region (optional)',
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _postalCodeController,
            hintText: 'Postal code',
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _countryController,
            hintText: 'Country',
          ),
        ],
      ),
    ),
  ];
}
