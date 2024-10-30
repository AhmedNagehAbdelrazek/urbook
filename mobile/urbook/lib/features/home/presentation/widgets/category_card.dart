import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.theme,
    required this.categoryName,
    required this.imagePath,
    required this.onTap,
  });

  final ThemeData theme;
  final String categoryName;
  final String imagePath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: LightColorPalette.black, width: 0.1.w),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            Text(
              categoryName,
              style: theme.textTheme.bodyMedium!.copyWith(),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
