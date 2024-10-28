import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/utils/assets_manager/image_paths.dart';
import '../widgets/on_boarding_Screen.dart';
import '../widgets/onboarding_bottom_sheet.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.only(bottom: mediaQuery.height * 0.18),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            controller: _controller,
            children: const [
              OnBoardingScreen(
                imagesPath: ImagePaths.onboarding1,
                title: "onboardingText1",
                description: "onboardingDescription1",
              ),
              OnBoardingScreen(
                imagesPath: ImagePaths.onboarding2,
                title: "onboardingText2",
                description: "onboardingDescription2",
              ),
              OnBoardingScreen(
                imagesPath: ImagePaths.onboarding3,
                title: "onboardingText3",
                description: "onboardingDescription3",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: OnboardingBottomSheet(
          mediaQuery: mediaQuery,
          isLastPage: isLastPage,
          controller: _controller,
          theme: theme,
        ),
      ),
    );
  }
}
