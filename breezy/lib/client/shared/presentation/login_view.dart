import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common_widgets/common_components/app_button_icon_widget.dart';
import '../../../core/common_widgets/common_components/app_button_widget.dart';
import '../../../core/common_widgets/common_components/app_text_field.dart';
import '../../../core/utils/theme/theme_extensions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
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
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
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

              AppButtonWidget(label: 'Login', onPressed: () {}),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 0.5,
                    width: 40.w,
                    color: context.theme.colorScheme.outlineVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'OR',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 0.5,
                    width: 40.w,
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
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    borderSideWidth: 0.5,
                    borderSideColor: context.theme.colorScheme.outlineVariant,
                    labelColor: context.theme.colorScheme.onSurfaceVariant,
                    buttonWidth: 30.w,
                  ),
                  const SizedBox(width: 16),
                  AppIconButtonWidget(
                    label: 'Apple',
                    icon: Icon(
                      Icons.apple,
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    borderSideWidth: 0.5,
                    borderSideColor: context.theme.colorScheme.outlineVariant,
                    labelColor: context.theme.colorScheme.onSurfaceVariant,
                    buttonWidth: 30.w,
                  ),
                ],
              ),

              const Spacer(),

              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                  children: [
                    TextSpan(
                      text: 'create account',
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
  }
}
