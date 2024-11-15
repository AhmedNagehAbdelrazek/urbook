import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/features/product_detail_view/presentation/widgets/product_button.dart';
import 'package:urbook/features/product_detail_view/presentation/widgets/product_colors.dart';
import 'package:urbook/features/product_detail_view/presentation/widgets/product_rates.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/top_curve_clipper.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int quantity = 1;
  int currentImageIndex = 0;
  final PageController _controller = PageController();
  bool isDescriptionExpanded = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: productAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: TopCurveClipper(),
                  child: Container(
                    color: Colors.grey.shade200,
                    height: 260.h,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 280.h,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => Image.asset(
                          ImagePaths.testImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: LightColorPalette.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductRates(),
                  const SizedBox(height: 8),
                  Text(
                    'Loop Silicone Strong Magnetic Watch',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('\$15.25', style: theme.textTheme.bodyLarge),
                      SizedBox(width: 8.h),
                      Text(
                        '\$20.00',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: BaseColorPalette.red),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('4.5 (2,495 reviews)',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    maxLines: isDescriptionExpanded ? 40 : 6,
                    overflow: TextOverflow.ellipsis,
                    getInfo(),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isDescriptionExpanded = !isDescriptionExpanded;
                      });
                    },
                    child: Text(
                      isDescriptionExpanded ? 'Read less' : 'Read more',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: LightColorPalette.cyan),
                    ),
                  ),
                  Text(
                    'color',
                    style: theme.textTheme.bodyMedium,
                  ).tr(),
                  SizedBox(height: 12.h),
                  const ProductColors(),
                  SizedBox(height: 16.h),
                  Text(
                    'Quantity',
                    style: theme.textTheme.bodyMedium,
                  ).tr(),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.4),
                    ),
                    child: addQuantity(),
                  ),
                  SizedBox(height: 80.h),
                  const ProductButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row addQuantity() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
          icon: const Icon(Icons.remove),
        ),
        Text(quantity.toString()),
        IconButton(
          onPressed: () => setState(() => quantity++),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

String getInfo() {
  return "Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for extended wear. Its lightweight design allows for a seamless blend of comfort and durability.\n\n"
      "One of the standout features of this watch band is its strong magnetic closure. The powerful magnets embedded within the band provide a secure and reliable connection, ensuring that your smartwatch stays firmly in place throughout the day. Say goodbye to worries about accidental detachment or slippage - the magnetic closure offers a peace of mind for active individuals on the go.\n\n"
      "The Loop Silicone Strong Magnetic Watch Band is highly versatile, compatible with a wide range of smartwatch models. Its adjustable strap length allows for a customizable fit, catering to various wrist sizes. Whether you're engaging in intense workouts or attending formal occasions, this watch band effortlessly adapts to your style and activity level.";
}
