import 'package:check_disposable_email/check_disposable_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/router/route_names.dart';
import '../utils/validators/validation_extensions.dart';
import 'common_components/app_button_icon_widget.dart';
import 'common_components/app_button_widget.dart';
import 'common_components/app_text_field.dart';
import '../utils/theme/theme_extensions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  // final EmailValidationStrategy emailValidationStrategy =
  //     EmailValidationStrategy(debug: true, allowTopLevelDomains: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 32, right: 32, top: 16),
        child: SafeArea(
          child: Form(
            key: loginFormKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const Spacer(),

                          Text(
                            'Log in',
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in to continue to your account',
                            style: context.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 24),

                          AppTextField(
                            controller: emailController,
                            hintText: 'Enter your email',
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: context.theme.colorScheme.onSurfaceVariant,
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
                            controller: passwordController,
                            hintText: 'Enter your password',
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: context.theme.colorScheme.onSurfaceVariant,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: context.theme.colorScheme.onSurfaceVariant,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          AppButtonWidget(
                            label: 'Login',
                            onPressed: () {
                              if (loginFormKey.currentState!.validate()) {
                                // Perform login action
                              }
                            },
                          ),
                          const SizedBox(height: 16),

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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIconButtonWidget(
                                label: 'Google',
                                icon: Icon(
                                  Icons.facebook,
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.transparent,
                                borderSideWidth: 0.5,
                                borderSideColor:
                                    context.theme.colorScheme.outlineVariant,
                                labelColor:
                                    context.theme.colorScheme.onSurfaceVariant,
                                buttonWidth: 30.w,
                              ),
                              const SizedBox(width: 16),
                              AppIconButtonWidget(
                                label: 'Apple',
                                icon: Icon(
                                  Icons.apple,
                                  color: context
                                      .theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                onPressed: () {},
                                backgroundColor: Colors.transparent,
                                borderSideWidth: 0.5,
                                borderSideColor:
                                    context.theme.colorScheme.outlineVariant,
                                labelColor:
                                    context.theme.colorScheme.onSurfaceVariant,
                                buttonWidth: 30.w,
                              ),
                            ],
                          ),

                          const Spacer(),

                          RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account? ',
                              style: context.textTheme.bodySmall?.copyWith(
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        context.go(AppRoutes.usercategory),
                                  text: 'Create account',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.theme.colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),
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
