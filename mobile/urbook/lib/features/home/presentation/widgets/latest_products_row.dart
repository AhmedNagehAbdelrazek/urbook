import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';

class LatestProductsRow extends StatelessWidget {
  const LatestProductsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "latest_products",
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
    );
  }
}
