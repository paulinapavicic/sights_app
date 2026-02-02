import 'package:flutter/material.dart';
import 'package:sights_app/presentation/auth/screen/sign_in_screen.dart';
import 'package:sights_app/presentation/auth/screen/splash_screen.dart';


import '../auth/screen/confirm_email_screen.dart';
import '../auth/screen/sign_up_screen.dart';
import '../common/presentation/screen/home_screen.dart';
import '../common/presentation/screen/reset_password_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String signInScreen = '/signIn';
  static const homeScreen = '/home';
  static const signUpScreen = '/signUp';
  static const resetPasswordScreen = '/resetPassword';
  static const verifyEmailScreen = '/verifyEmail';

  AppRouter._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUpScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ResetPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());
      case verifyEmailScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyEmailScreen(),
        );
      default:
        throw Exception("Route not found...");
    }
  }
}
