import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_primary_button.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        validators: [Validators.required],
      ),
    }, validators: [
      const MustMatchValidator('password','confirmPassword', true)
    ]);

    return ReactiveForm(
      formGroup: formGroup,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          CustomTextField(
            formControlName: 'email',
            labelText: 'Email',
            validationMessages: {
              ValidationMessage.email: (_) => 'Please enter a valid email',
              ValidationMessage.required: (_) => 'Please enter your email',
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            formControlName: 'password',
            labelText: 'Password',
            isPasswordField: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter your password',
              ValidationMessage.minLength: (_) => 'Password must be at least 8 characters',
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            formControlName: 'confirmPassword',
            labelText: 'Confirm Password',
            isPasswordField: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter your password again',
              ValidationMessage.mustMatch: (_) => 'Passwords do not match',
            },
          ),
          const SizedBox(height: 40),
          CustomPrimaryButton(
            labelText: 'Sign up',
            onPressed: () {

              formGroup.markAllAsTouched();
              if (formGroup.valid) {
                ref.read(authNotifierProvider.notifier).signUp(
                  context,
                  formGroup.control('email').value,
                  formGroup.control('password').value,
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
