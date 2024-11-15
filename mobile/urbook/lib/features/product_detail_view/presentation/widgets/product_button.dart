import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/core/widgets/custom_elevated_button.dart';

import '../../../../core/constants/icon_paths.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed: () {},
            text: 'buy_now',
            hight: 50,
            backGroundColor: LightColorPalette.white,
            textColor: LightColorPalette.black,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: CustomElevatedButton(
            onPressed: () {},
            text: 'add_to_cart',
            haveIcon: true,
            iconPath: IconPaths.shoppingCart,
            hight: 50,
          ),
        ),
      ],
    );
  }
}