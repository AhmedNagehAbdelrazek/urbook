import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = LightColorPalette.white,
    this.backGroundColor,
    this.haveIcon = false,
    this.iconPath = "",
  });
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color? backGroundColor;
  final bool haveIcon;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(mediaQuery.width.w, 60.h),
          backgroundColor: backGroundColor),
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(color: textColor),
        ).tr(),
        haveIcon ? Image.asset(iconPath) : const SizedBox(width: 0),
      ]),
    );
  }
}
