import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';

import 'category_card.dart';

class CategoriesOptionsView extends StatelessWidget {
  const CategoriesOptionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "categories",
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ).tr(),
              InkWell(
                onTap: () {},
                child: Text(
                  "see_all",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: LightColorPalette.cyan),
                ).tr(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                onTap: () {},
                theme: theme,
                categoryName: "electronics",
                imagePath: ImagePaths.electronics,
              ),
              CategoryCard(
                onTap: () {},
                theme: theme,
                categoryName: "fashion",
                imagePath: ImagePaths.fashion,
              ),
              CategoryCard(
                onTap: () {},
                theme: theme,
                categoryName: "furniture",
                imagePath: ImagePaths.furniture,
              ),
              CategoryCard(
                onTap: () {},
                theme: theme,
                categoryName: "industrial",
                imagePath: ImagePaths.industrial,
              )
            ],
          )
        ],
      ),
    );
  }
}
