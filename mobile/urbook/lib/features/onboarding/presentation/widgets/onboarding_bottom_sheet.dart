import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_button.dart';

class OnboardingBottomSheet extends StatelessWidget {
  const OnboardingBottomSheet({
    super.key,
    required this.mediaQuery,
    required this.isLastPage,
    required PageController controller,
    required this.theme,
  }) : _controller = controller;

  final Size mediaQuery;
  final bool isLastPage;
  final PageController _controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.height * 0.18,
      child: Column(
        children: [
          OnboardingButton(
              isLastPage: isLastPage, controller: _controller, theme: theme),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
