import 'package:flutter/material.dart';
import 'package:urbook/features/auth/presentation/views/create_password_view.dart';
import 'package:urbook/features/auth/presentation/views/email_confirmation_view.dart';
import 'package:urbook/features/auth/presentation/views/email_verification_view.dart';
import 'package:urbook/features/auth/presentation/views/login_view.dart';
import 'package:urbook/features/auth/presentation/views/password_created_successfully_view.dart';
import 'package:urbook/features/auth/presentation/views/signup_view.dart';
import 'package:urbook/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:urbook/features/splash/presentation/views/splash_view.dart';
import 'page_route_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRouteName.onboardingView:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: settings,
        );
      case PageRouteName.signupView:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
          settings: settings,
        );
      case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );
      case PageRouteName.emailVerificationView:
        return MaterialPageRoute(
          builder: (context) => const EmailVerificationView(),
          settings: settings,
        );
      case PageRouteName.emailConfirmationView:
        return MaterialPageRoute(
          builder: (context) => const EmailConfirmationView(),
          settings: settings,
        );
      case PageRouteName.createPasswordView:
        return MaterialPageRoute(
          builder: (context) => const CreatePasswordView(),
          settings: settings,
        );
        case PageRouteName.passwordCreatedSuccessfullyView:
        return MaterialPageRoute(
          builder: (context) => const PasswordCreatedSuccessfullyView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: settings,
        );
    }
  }
}
