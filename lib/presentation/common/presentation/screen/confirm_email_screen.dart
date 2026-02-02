import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation//common/presentation/widget/custom_app_bar.dart';


class VerifyEmailScreen extends HookConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isResetPassword = ModalRoute.of(context)!.settings.arguments ==
        AppRouter.resetPasswordScreen;

    return Scaffold(
      appBar: CustomAppBar(
        title: isResetPassword ? "Reset Password" : "Verify Email",
        elevation: 10,
        isBackButtonVisible: true,
        isTitleCentered: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: Image(
                    image: AssetImage('assets/images/mail_sent.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    isResetPassword
                        ? "Please check your inbox and reset your password."
                        : "Please check your inbox and verify your email address.",
                    style: context.textStandard,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the email?",
                        style: context.textStandard,
                      ),
                      TextButton(
                        onPressed: () {
                          if (isResetPassword) {
                            Navigator.of(context)
                                .pushNamed(AppRouter.resetPasswordScreen);
                          } else {
                            ref
                                .read(authNotifierProvider.notifier)
                                .resendVerificationEmail();
                          }
                        },
                        child: Text(
                          isResetPassword ? "Try again" : "Resend",
                          style: context.textStandard.copyWith(
                            color: context.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
