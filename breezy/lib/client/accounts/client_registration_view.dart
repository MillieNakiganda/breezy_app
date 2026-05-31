import 'package:breezy/core/utils/theme/theme_extensions.dart';
import 'package:breezy/core/utils/validators/validation_extensions.dart';
import 'package:check_disposable_email/check_disposable_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/common_widgets/common_components/app_bar_widget.dart';
import '../../core/common_widgets/common_components/app_button_icon_widget.dart';
import '../../core/common_widgets/common_components/app_button_widget.dart';
import '../../core/common_widgets/common_components/app_text_field.dart';
import '../../core/utils/router/route_names.dart';

class ClientRegistrationView extends StatefulWidget {
  const ClientRegistrationView({super.key});

  @override
  State<ClientRegistrationView> createState() => _ClientRegistrationViewState();
}

class _ClientRegistrationViewState extends State<ClientRegistrationView> {
  final registrationKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  Map<String, bool> get passwordRules {
    final password = passwordController.text;
    return {
      '8 characters': password.atleast8Characters,
      '1 uppercase letter': password.atleastOneUppercase,
      '1 lowercase letter': password.atleastOneLowercase,
      '1 number': password.atleastOneNumber,
      '1 character': password.atleastOneSpecialCharacter,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Form(
          key: registrationKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Create Your Account',
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            textAlign: TextAlign.justify,
                            'Join Breezy as a client to book cleaners in your area',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              SizedBox(
                                width: 40.w,
                                child: AppTextField(
                                  controller: nameController,
                                  hintText: 'First Name',
                                  prefixIcon: const Icon(
                                    PhosphorIcons.user,
                                    size: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 40.w,
                                child: AppTextField(
                                  controller: nameController,
                                  hintText: 'Last Name',
                                  prefixIcon: const Icon(
                                    PhosphorIcons.user,
                                    size: 18,
                                  ),
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

                              final email = Disposable.instance.validateEmail(
                                trimmed,
                              );

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
                            prefixIcon: const Icon(
                              PhosphorIcons.phone,
                              size: 18,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppTextField(
                            controller: passwordController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              PhosphorIcons.lockSimple,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          passwordController.text.isNotEmpty &&
                                  !passwordController.text.isValidPassword
                              ? Center(
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    alignment: WrapAlignment.center,
                                    spacing: 8,
                                    children: passwordRules.keys
                                        .map(
                                          (e) => FilterChip(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            label: Text(e),
                                            selected: passwordRules[e] ?? false,
                                            onSelected: (value) {},
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              : SizedBox.shrink(),
                          Visibility(
                            visible: passwordController.text.isValidPassword,
                            child: Column(
                              children: [
                                AppTextField(
                                  autoValidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value != passwordController.text) {
                                      return 'Passwords don\'t match';
                                    }
                                    return null;
                                  },
                                  controller: confirmPasswordController,
                                  hintText: 'Confirm Password',
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    size: 18,
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
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          side: BorderSide(
                                            color: context
                                                .theme
                                                .colorScheme
                                                .primary,
                                          ),
                                          checkColor: context
                                              .theme
                                              .colorScheme
                                              .onPrimary,
                                          fillColor:
                                              WidgetStatePropertyAll<Color>(
                                                context
                                                    .theme
                                                    .colorScheme
                                                    .primary,
                                              ),
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'I agree to the Terms and Conditions',
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                            color: context
                                                .theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          AppButtonWidget(
                            label: 'Create Account',
                            onPressed: () {
                              if (registrationKey.currentState!.validate()) {}
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
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
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
                            borderSideColor:
                                context.theme.colorScheme.outlineVariant,
                            labelColor:
                                context.theme.colorScheme.onSurfaceVariant,
                          ),

                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign in',
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                          color:
                                              context.theme.colorScheme.primary,
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
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
