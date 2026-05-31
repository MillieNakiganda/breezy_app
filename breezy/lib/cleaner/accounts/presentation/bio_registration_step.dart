import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:breezy/core/utils/validators/validation_extensions.dart';
import 'package:check_disposable_email/check_disposable_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_button_icon_widget.dart';
import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/app_text_field.dart';
import '../../../core/utils/router/route_names.dart';

class BioRegistrationStep extends StatefulWidget {
  const BioRegistrationStep({super.key, required this.onContinue});
  final VoidCallback onContinue;

  @override
  State<BioRegistrationStep> createState() => _BioRegistrationStepState();
}

class _BioRegistrationStepState extends State<BioRegistrationStep> {
  final cleanerRegistrationKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

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
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      PhosphorIcons.envelopeSimple,
                      size: 18,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }

                      final trimmed = value.trim();

                      if (!trimmed.isValidEmail) {
                        return 'Please enter a valid email address';
                      }

                      final email = Disposable.instance.validateEmail(trimmed);

                      if (!email.isFormatValid) {
                        return 'Please enter a valid email address';
                      }

                      if (email.isDisposable) {
                        return 'Please enter a non-disposable email address';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    prefixIcon: const Icon(PhosphorIcons.phone, size: 18),
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
                    label: 'Continue',
                    onPressed: () {
                      if (cleanerRegistrationKey.currentState!.validate()) {
                        widget.onContinue();
                      }
                    },
                  ),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        width: 26.w,
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'OR',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 0.5,
                        width: 26.w,
                        color: context.theme.colorScheme.outlineVariant,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  AppIconButtonWidget(
                    label: 'Google',
                    icon: Icon(
                      Icons.facebook,
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    borderSideWidth: 0.5,
                    borderSideColor: context.theme.colorScheme.outlineVariant,
                    labelColor: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
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
          ),
        ],
      ),
    );
  }
}
