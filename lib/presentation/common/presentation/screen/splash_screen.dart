import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/auth/notifier/state/authentication_state.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _redirectToNextScreen(context, ref);

    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(
                image: AssetImage('assets/images/camping_image.png'),
              ),
            ),
            Lottie.asset('assets/animations/loading_dots.json', height: 100),
          ],
        ),
      ),
    );
  }

  void _redirectToNextScreen(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 1), () {
      final authState = ref.read(authNotifierProvider);
      if (authState is AuthenticatedState) {
        Navigator.of(context).pushNamed(AppRouter.homeScreen);
      } else {
        Navigator.of(context).pushNamed(AppRouter.signInScreen);
      }
    });
  }
}
