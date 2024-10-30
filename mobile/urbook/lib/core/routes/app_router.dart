import 'package:flutter/material.dart';
import 'package:urbook/core/routes/app_views.dart';

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
      case PageRouteName.layoutView:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
        case PageRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
        case PageRouteName.wishListView:
        return MaterialPageRoute(
          builder: (context) => const WishListView(),
          settings: settings,
        );
        case PageRouteName.profileView:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );
        case PageRouteName.myCartView:
        return MaterialPageRoute(
          builder: (context) => const MyCartView(),
          settings: settings,
        );
        case PageRouteName.categoriesView:
        return MaterialPageRoute(
          builder: (context) => const CategoriesView(),
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
