import 'package:flutter/material.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: settings,
        );
    }
  }
}
