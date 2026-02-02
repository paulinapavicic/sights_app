import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_primary_button.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);



    final formGroup = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
        value: "ppavicic@gmail.com"
      ),
      'password': FormControl<String>(
        validators: [Validators.required],
        value: "12345678"
      ),
    });

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
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRouter.resetPasswordScreen);
              },
              child: Text("Forgot password?",
                  style: context.textStandard.copyWith(
                    color: context.textColor,
                  ),),
            ),
          ),
          const SizedBox(height: 20),
          CustomPrimaryButton(
            labelText: 'Sign in',
            onPressed: () {
              formGroup.markAllAsTouched();
              if (formGroup.valid) {

                ref.read(authNotifierProvider.notifier).signIn(
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
