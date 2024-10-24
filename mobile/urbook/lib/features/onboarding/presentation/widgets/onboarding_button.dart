import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/themes/color_palette.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.isLastPage,
    required PageController controller,
    required this.theme,
  }) : _controller = controller;

  final bool isLastPage;
  final PageController _controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
      ),
      onPressed: () {
        if (isLastPage) {
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Text(
        isLastPage ? 'Get Started' : 'Next',
        style: theme.textTheme.bodyMedium!
            .copyWith(color: LightColorPalette.white),
      ).tr(),
    );
  }
}
