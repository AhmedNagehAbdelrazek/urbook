import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';

import 'exclusive_sales_card.dart';

class ExclusiveSalesCardsView extends StatefulWidget {
  const ExclusiveSalesCardsView({super.key});

  @override
  _ExclusiveSalesCardsViewState createState() =>
      _ExclusiveSalesCardsViewState();
}

class _ExclusiveSalesCardsViewState extends State<ExclusiveSalesCardsView> {
  final PageController _controller = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = _controller.page!.toInt() + 1;
        _controller.animateToPage(
          nextPage % 4,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightColorPalette.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            children: [
              ExclusiveSalesCard(
                imagePath: ImagePaths.test,
                voidCallback: () {},
              ),
              ExclusiveSalesCard(
                imagePath: ImagePaths.test2,
                voidCallback: () {},
              ),
              ExclusiveSalesCard(
                imagePath: ImagePaths.test,
                voidCallback: () {},
              ),
              ExclusiveSalesCard(
                imagePath: ImagePaths.test2,
                voidCallback: () {},
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: LightColorPalette.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: WormEffect(
                  dotHeight: 5.h,
                  dotWidth: 5.w,
                  activeDotColor: LightColorPalette.cyan,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
