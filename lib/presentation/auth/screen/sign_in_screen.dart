import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/auth/notifier/state/authentication_state.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';

import '../widget/sign_in_form.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Image(
                      image: AssetImage('assets/images/login_image.png'),
                    ),
                  ),
                  Text(
                    "Please sign in to your account.",
                    style: context.textStandard,
                  ),
                  const SizedBox(height: 20),
                  const SignInForm(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: context.textStandard,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.signUpScreen);
                        },
                        child: Text(
                          "Sign up",
                          style: context.textStandard.copyWith(
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}