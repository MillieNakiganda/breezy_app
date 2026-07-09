import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/app_text_field.dart';
import '../../../core/utils/router/route_names.dart';

class BioRegistrationStep extends StatefulWidget {
  const BioRegistrationStep({
    super.key,
    required this.onSubmit,
    required this.onError,
  });

  final Future<void> Function({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String gender,
  })
  onSubmit;
  final void Function(Object error) onError;

  @override
  State<BioRegistrationStep> createState() => _BioRegistrationStepState();
}

class _BioRegistrationStepState extends State<BioRegistrationStep> {
  final cleanerRegistrationKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? selectedGender;
  DateTime? selectedDateOfBirth;
  bool isSubmitting = false;

  static const List<String> _genderOptions = [
    'Male',
    'Female',
    'Prefer not to say',
  ];

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDateOfBirth ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1940),
      lastDate: DateTime(now.year - 16, now.month, now.day),
    );
    if (picked != null) {
      setState(() => selectedDateOfBirth = picked);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} / '
        '${date.month.toString().padLeft(2, '0')} / '
        '${date.year}';
  }

  String normalizeGender(String gender) {
    return gender.toLowerCase();
  }

  Future<void> handleContinue() async {
    if (!cleanerRegistrationKey.currentState!.validate()) return;
    if (selectedDateOfBirth == null || selectedGender == null) return;

    setState(() => isSubmitting = true);
    try {
      await widget.onSubmit(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        dateOfBirth: selectedDateOfBirth!,
        gender: normalizeGender(selectedGender!),
      );
    } catch (error) {
      widget.onError(error);
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cleanerRegistrationKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: AppTextField(
                          controller: firstNameController,
                          hintText: 'First Name',
                          prefixIcon: const Icon(PhosphorIcons.user, size: 18),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 40.w,
                        child: AppTextField(
                          controller: lastNameController,
                          hintText: 'Last Name',
                          prefixIcon: const Icon(PhosphorIcons.user, size: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    prefixIcon: const Icon(PhosphorIcons.phone, size: 18),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    initialValue: selectedGender,
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.onSurfaceVariant,
                      ),
                      filled: true,
                      fillColor: context.theme.colorScheme.surfaceContainerLow,
                      prefixIcon: const Icon(
                        PhosphorIcons.genderIntersex,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.colorScheme.outlineVariant,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.colorScheme.primary,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                    dropdownColor:
                        context.theme.colorScheme.surfaceContainerLow,
                    icon: Icon(
                      PhosphorIcons.caretDown,
                      size: 16,
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                    items: _genderOptions
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => selectedGender = value),
                    validator: (value) =>
                        value == null ? 'Please select your gender' : null,
                  ),

                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _pickDateOfBirth,
                    child: FormField<DateTime>(
                      initialValue: selectedDateOfBirth,
                      validator: (_) => selectedDateOfBirth == null
                          ? 'Please select your date of birth'
                          : null,
                      builder: (field) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 52,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color:
                                  context.theme.colorScheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: field.hasError
                                    ? context.theme.colorScheme.error
                                    : context.theme.colorScheme.outlineVariant,
                                width: 0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  PhosphorIcons.calendarBlank,
                                  size: 18,
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    selectedDateOfBirth != null
                                        ? _formatDate(selectedDateOfBirth!)
                                        : 'Date of Birth',
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: selectedDateOfBirth != null
                                              ? context
                                                    .theme
                                                    .colorScheme
                                                    .onSurface
                                              : context
                                                    .theme
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                        ),
                                  ),
                                ),
                                Icon(
                                  PhosphorIcons.caretDown,
                                  size: 16,
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                          if (field.hasError)
                            Padding(
                              padding: const EdgeInsets.only(top: 6, left: 12),
                              child: Text(
                                field.errorText!,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.theme.colorScheme.error,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        margin: const EdgeInsets.only(right: 8),
                        child: Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            value: true,
                            tristate: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(
                              color: context.theme.colorScheme.primary,
                            ),
                            checkColor: context.theme.colorScheme.onPrimary,
                            fillColor: WidgetStatePropertyAll<Color>(
                              context.theme.colorScheme.primary,
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "I accept Breezy's ",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                          children: [
                            TextSpan(
                              text: 'Service Provider Terms',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go(AppRoutes.loginView);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  AppButtonWidget(
                    label: isSubmitting ? 'Saving...' : 'Continue',
                    onPressed: isSubmitting ? null : handleContinue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
